var express = require('express');
var async = require('async');
var router = express.Router();

var userService = require('../service/user.service');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/login', function (req, res, next) {

});

router.post('/login', function(req, res, next) {

});

router.get('/join', function (req, res, next) {
    res.render('join', {});
});

router.post('/join', function (req, res, next) {
    var user = req.body;
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

    async.parallel({}, function (err, results) {

    });

    res.redirect('/');
});

module.exports = router;
