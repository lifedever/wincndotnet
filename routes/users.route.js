var express = require('express');
var async = require('async');
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
            res.send('添加收藏成功!');
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
        res.render('favorites', {
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
            req.flash(config.constant.flash.success, '已移除收藏!');
            res.redirect('/user/' + user.username + '/favorite');
        }
    });
});

/* GET users listing. */
router.get('/share', function (req, res, next) {
    var id = req.query.id;
    articleService.findById(id, function (err, article) {
        if (err) {
            next(err);
        } else {
            res.render('user/share', {
                menu: 'share',
                article: article
            });
        }
    });
});

router.post('/share', function (req, res, next) {
    var article = req.body;

    article._user = req.session.user._id;
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
module.exports = router;