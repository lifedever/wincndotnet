var express = require('express');
var async = require('async');
var router = express.Router();

var config = require('../config');
var userService = require('../service/user.service');

/* GET home page. */
router.get('/', function (req, res, next) {
    res.render('index', {title: 'Express'});
});

router.get('/login', function (req, res, next) {
    res.render('login');

});

router.post('/login', function (req, res, next) {
    var user = req.body;
    async.waterfall({

    }, function(){

    });
    req.flash(config.constant.flash.success, '欢迎回来, ' + user.username + '!');
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

module.exports = router;
