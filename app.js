var express = require('express');
var session = require('express-session');
var flash = require('connect-flash');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var mongoose = require('mongoose');
var swig = require('swig');
var wx = require('wechat');

var authority = require('./lib/authority');
var swigExtends = require('./lib/swig.extends');
var wxRobot = require('./lib/wx.robot');
var wxHelper = require('./lib/wx.helper');
var crypto = require('./lib/crypto.utils');

var config = require('./config');
var app = express();

if (config.wx.load) {  // 是否加载微信配置信息
    wxHelper.loadWX();
}

mongoose.connect(config.db.url);

// view engine setup
swig.setDefaults({cache: false});
app.engine('swig', swig.renderFile);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'swig');
app.set('view cache', false);

swigExtends(swig);

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));


app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(session({
    secret: config.db.cookieSecret,
    cookie: {maxAge: 60 * 60 * 60 * 1000}
}));

app.use(flash());

/**
 * 全局参数传递
 */
app.use(function (req, res, next) {
    res.locals.site = config.site;
    res.locals.success = req.flash(config.constant.flash.success);
    res.locals.error = req.flash(config.constant.flash.error);
    res.locals.session = req.session;
    next();
});

/**
 * 处理Cookie
 */
app.use(function (req, res, next) {
    if (req.cookies[config.constant.cookie.user]) {
        var cookieUser = JSON.parse(crypto.decrypt(req.cookies[config.constant.cookie.user], config.db.cookieSecret));
        var user = req.session.user;
        if (cookieUser && !user)
            req.session.user = cookieUser;
    }
    next();
});

app.use('/', require('./routes/index.route'));
app.use('/u', require('./routes/index-u.route'));
app.use('/p', require('./routes/index-p.route'));
app.use('/user', authority.isLogin, require('./routes/users.route'));
app.use('/dashboard', authority.isAdmin, require('./routes/dashboard.route'));


// wx
app.use('/api/wx', wx(global.wx, function (req, res, next) {
    var wx = req.weixin;
    wxRobot.reply(wx, res);
}));

// catch 404 and forward to error handler
app.use(function (req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function (err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}

// production error handler
// no stacktraces leaked to user
app.use(function (err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});


module.exports = app;
