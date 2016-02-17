var config = require('../config');

'use strict';

module.exports = {
    /**
     * 是否登陆
     */
    isLogin: function (req, res, next) {
        var user = req.session.user;
        if(user) {
            next();
        }else{
            req.flash(config.constant.flash.error, '请先登录!');
            res.redirect('/login');
        }
    },
    /**
     * 是否是管理员
     */
    isAdmin: function(req, res, next) {
        var user = req.session.user;
        if(user && user.role === config.role.admin) {
            return next();
        }else{
            req.flash(config.constant.flash.error, '禁止访问!');
            res.redirect('/');
        }
    }
};