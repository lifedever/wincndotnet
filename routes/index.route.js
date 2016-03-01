var express = require('express');
var async = require('async');
var router = express.Router();

var cryptoUtils = require('../lib/crypto.utils');

var config = require('../config');
var userService = require('../service/user.service');
var articleService = require('../service/article.service');
var tagService = require('../service/tag.service');

/* GET home page. */
router.get('/', function (req, res, next) {
    var page = req.query.page || 0;
    async.parallel({

        articles: function (callback) {
            articleService.findPublished({}, page * 10, 10, callback);
        },
        count: function (callback) {
            articleService.count(callback);
        },
        tags: function (callback) {
            articleService.findTags(callback);
        },
        user: function (callback) {
            if (req.session.user)
                userService.findById(req.session.user._id, callback);
            else {
                callback(null, {favorites: null});
            }
        }
    }, function (err, results) {
        res.render('index', {
            articles: results.articles,
            favorites: results.user.favorites,
            count: results.count,
            page: (Number(page) + 1),
            tags: results.tags
        });
    });
});

router.get('/search', function (req, res, next) {
    var q = req.query.q || '';
    if(q!= ''){
        async.parallel({
            articles: function (callback) {
                articleService.findPublishedAll({$or: [{title: new RegExp(q, 'i')}, {tags: q}]}, callback);
            },
            count: function (callback) {
                articleService.count(callback);
            },
            tags: function (callback) {
                articleService.findTags(callback);
            },
            user: function (callback) {
                if (req.session.user)
                    userService.findById(req.session.user._id, callback);
                else {
                    callback(null, {favorites: null});
                }
            }
        }, function (err, results) {
            res.render('search', {
                articles: results.articles,
                favorites: results.user.favorites,
                tag: results.tag,
                key: q,
                tags: results.tags
            });
        });
    }else{
        res.redirect('/');
    }
});

router.get('/tags/:tag', function (req, res, next) {
    var tag = req.params.tag;
    async.parallel({
        articles: function (callback) {
            articleService.findPublishedAll({tags: tag}, callback);
        },
        tags: function (callback) {
            articleService.findTags(callback);
        },
        tag: function (callback) {
            tagService.findTag(tag, callback);
        },
        user: function (callback) {
            if (req.session.user)
                userService.findById(req.session.user._id, callback);
            else {
                callback(null, {favorites: null});
            }
        }
    }, function (err, results) {
        res.render('tags', {
            articles: results.articles,
            favorites: results.user.favorites,
            tag: results.tag,
            tagName: tag,
            tags: results.tags
        });
    });
});

router.get('/source/:source', function (req, res, next) {
    var source = req.params.source;
    async.parallel({
        articles: function (callback) {
            articleService.findPublishedAll({source: source}, callback);
        },
        tags: function (callback) {
            articleService.findTags(callback);
        },
        user: function (callback) {
            if (req.session.user)
                userService.findById(req.session.user._id, callback);
            else {
                callback(null, {favorites: null});
            }
        }
    }, function (err, results) {
        res.render('source', {
            articles: results.articles,
            favorites: results.user.favorites,
            source: source,
            tags: results.tags
        });
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
                res.cookie(config.constant.cookie.user, cryptoUtils.encrypt(JSON.stringify(dbUser), config.db.cookieSecret), {maxAge: 1000 * 60 * 60 * 60 * 24 * 7});
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
    res.clearCookie(config.constant.cookie.user);
    res.redirect('/');
});


module.exports = router;
