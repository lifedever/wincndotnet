var express = require('express');
var async = require('async');
var xss = require('xss');
var router = express.Router();

var articleService = require('../service/article.service');
var userService = require('../service/user.service');

var config = require('../config');

router.get('/favorite/:id', function (req, res, next) {
    var pid = req.params.id;
    var user = req.session.user;

    userService.updateById(user._id, {$addToSet: {favorites: pid}}, function (err, raw) {
        if (err) {
            next(err);
        } else {
            async.waterfall([
                function (callback) {
                    articleService.findById(pid, callback);
                },
                function (article, callback) {
                    articleService.updateById(pid, {favorite_count: article.favorite_count + 1}, callback);
                }
            ], function (err, raw) {
                if (err) {
                    next(err);
                } else {
                    res.send('添加收藏成功!');
                }
            });
        }
    });
});

router.get('/:username/favorite', function (req, res, next) {
    var username = req.params.username;
    async.waterfall([
        function (callback) {
            articleService.findTags(callback);
        },
        function (tags, callback) {
            userService.findUserByUsername(username, function (err, user) {
                callback(err, user.favorites, tags);
            })
        },
        function (favorites, tags, callback) {
            articleService.findPublishedAll({_id: {$in: favorites}}, function (err, articles) {
                callback(err, articles, tags);
            });
        }
    ], function (error, articles, tags) {
        res.render('user/favorites', {
            menu: 'favorite',
            tags: tags,
            articles: articles
        });
    });
});

router.get('/:username/favorite/remove/:id', function (req, res, next) {
    var user = req.session.user;
    var id = req.params.id;
    userService.updateById(user._id, {$pull: {favorites: id}}, function (err, raw) {
        if (err) {
            next(err);
        } else {
            async.waterfall([
                function (callback) {
                    articleService.findById(id, callback);
                },
                function (article, callback) {
                    if (article.favorite_count > 0) {
                        articleService.updateById(article.id, {favorite_count: article.favorite_count - 1}, callback);
                    } else {
                        callback(null, null);
                    }
                }
            ], function (err, raw) {
                if (err) {
                    next(err);
                } else {
                    req.flash(config.constant.flash.success, '已移除收藏!');
                    res.redirect('/user/' + user.username + '/favorite');
                }
            });
        }
    });
});

/* GET users listing. */
router.get('/share', function (req, res, next) {
    var id = req.query.id;
    async.parallel({
        article: function (callback) {
            articleService.findById(id, callback);
        },
        tags: function (callback) {
            articleService.findTags(callback);
        }
    }, function (err, results) {
        if (err) {
            next(err);
        } else {
            res.render('user/share', {
                menu: 'share',
                tags: results.tags,
                article: results.article
            });
        }
    });
});

router.post('/share', function (req, res, next) {
    var article = req.body;
    var user = req.session.user;
    article.summary = xss(article.summary, {
        whiteList: [],        // 白名单为空，表示过滤所有标签
        stripIgnoreTag: true,      // 过滤所有非白名单标签的HTML
        stripIgnoreTagBody: ['script'] // script标签较特殊，需要过滤标签中间的内容
    });
    article._user = user._id;
    article.tags = articleService.getTags(article.articleTags);
    if (article.id) {
        articleService.updateById(article.id, article, function (err, article) {
            if (err) {
                next(err);
            } else {
                req.flash(config.constant.flash.success, '编辑成功!');
                res.redirect('/dashboard/articles');
            }
        });
    } else {
        if (user.role == 'admin')
            article.status = true;
        articleService.saveArticle(article, function (err, article) {
            if (err) {
                next(err);
            } else {
                req.flash(config.constant.flash.success, '分享成功，请耐心等待管理员审核!');
                res.redirect('/user/share');
            }
        })
    }
});

router.get('/share/parseUrl', function (req, res, next) {
    var url = req.query.url;
    articleService.parseUrl(decodeURI(url), function (err, model) {
        res.send(model);
    });
});

router.get('/profile', function (req, res, next) {
    userService.findUserByUsername(req.session.user.username, function (err, user) {
        if (err) {
            next(err);
        } else {
            res.render('user/profile', {user: user, menu: 'profile'});
        }
    })
});

router.post('/profile', function (req, res, next) {
    userService.updateById(req.session.user._id, {
        website: req.body.website,    // 个人网站
        address: req.body.address,    // 所在地点
        github: req.body.github, // github
        weibo: req.body.weibo, // weibo
        job: req.body.job,      // 职业
        signature: req.body.signature  // 个人签名
    }, function (err, user) {
        if (!err) {
            req.flash(config.constant.flash.success, '修改成功!');
            res.redirect('/user/profile');
        } else {
            next(err);
        }
    });
});
module.exports = router;