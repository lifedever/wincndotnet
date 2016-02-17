var express = require('express');
var async = require('async');
var router = express.Router();

var config = require('../config');
var userService = require('../service/user.service');
var articleService = require('../service/article.service');

/* GET home page. */
router.get('/', function (req, res, next) {
    articleService.findPublished(function (err, articles) {
        res.render('index', {articles: articles});
    });
});

router.get('/login', function (req, res, next) {
        if (req.session.user) {
            res.redirect('/');
            return;
        } else {
            next();
        }
    }, function (req, res, next) {
        res.render('login');

    }
);

router.post('/login', function (req, res, next) {
    var user = req.body;
    userService.findUserByUsername(user.username, function (err, dbUser) {
        if (err) {
            next(err);
        } else {
            if (dbUser && userService.validatePassword(user.password, dbUser.password)) {
                req.flash(config.constant.flash.success, '欢迎回来, ' + user.username + '!');
                req.session.user = dbUser;

                res.redirect(req.session.originalUrl ? req.session.originalUrl : '/');
            } else {
                req.flash(config.constant.flash.error, '用户名或密码错误!');
                res.redirect('/login');
            }
        }
    });

});

router.get('/join', function (req, res, next) {
    res.render('join', {});
});

router.post('/join', function (req, res, next) {
    var user = req.body;
    if (!user.username || !user.password) {
        req.flash(config.constant.flash.error, '用户名或密码不能为空!');
        res.redirect('/join');
        return;
    }
    if (!user.email) {
        req.flash(config.constant.flash.error, '邮箱不能为空!');
        res.redirect('/join');
        return;
    }
    if (user.password != user.confirm_password) {
        req.flash(config.constant.flash.error, '两次密码输入不一致!');
        res.redirect('/join');
        return;
    }

    async.parallel({
        username: function (callback) {
            userService.findUserByUsername(user.username, callback);
        },
        email: function (callback) {
            userService.findUserByEmail(user.email, callback);
        }
    }, function (err, results) {
        if (results.username) {
            req.flash(config.constant.flash.error, '用户名已被占用!');
            res.redirect('/join');
            return;
        }
        if (results.email) {
            req.flash(config.constant.flash.error, '邮箱已被占用!');
            res.redirect('/join');
            return;
        }
        userService.registerUser(user, function (err, user) {
            if (err) {
                next(err);
            } else {
                req.flash(config.constant.flash.success, '注册成功，请登录!');
                res.redirect('/login');
            }
        });
    });
});

router.get('/logout', function (req, res, next) {
    req.session.destroy();
    res.redirect('/');
});


module.exports = router;