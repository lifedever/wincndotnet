var config = require('../config');

'use strict';

module.exports = {
    /**
     * 是否登陆
     */
    isLogin: function (req, res, next) {
        var user = req.session.user;
        if(user) {
            req.session.originalUrl = null;
            next();
        }else{
            req.session.originalUrl = req.originalUrl;
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
            req.session.originalUrl = null;
            return next();
        }else{
            req.session.originalUrl = req.originalUrl;
            req.flash(config.constant.flash.error, '禁止访问!');
            res.redirect('/login');
        }
    }
};