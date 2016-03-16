var express = require('express');
var async = require('async');
var superagent = require('superagent')
var lodash = require('lodash');

var router = express.Router();

var articleService = require('../service/article.service');
var userService = require('../service/user.service');

router.get('/:id/redirect', function (req, res, next) {
    var id = req.params.id;
    var user = req.session.user;
    if (user) {     // 用户已登录，跳转到查看页
        res.send('/p/' + id);
    } else {  // 用户没登录，跳转到文章源地址
        articleService.findById(id, function (err, article) {
            if (err) {
                next(err);
            } else {
                res.send(article.url);
            }
        });
    }
});

router.get('/:id/preview', function (req, res, next) {
    var id = req.params.id;
    articleService.findById(id, function (err, article) {
        if (err) {
            next(err);
        } else {
            res.send(article);
        }
    });
});


router.get('/:id', function (req, res, next) {
    var id = req.params.id;
    async.waterfall([
        function (callback) {
            articleService.findById(id, callback);
        },
        function (article, callback) {
            article.views += 1;
            articleService.updateById(id, {views: article.views}, function (err, raw) {
                callback(err, article);
            });
        },
        function (article, callback) {
            articleService.findPublished({
                _id: {$ne: article.id},
                tags: {$in: article.tags}
            }, 0, 5, function (err, articles) {
                callback(err, article, articles);
            });
        },
        function (article, articles, callback) {
            userService.findByFavoriteArticle(id, function (err, users) {
                callback(err, article, articles, users);
            });
        }
    ], function (err, article, articles, favoriteUsers) {
        if (err) {
            next(err);
        } else if (article) {
            res.render('p/view', {
                article: article,
                user: article._user,
                favoriteUsers: favoriteUsers,
                articles: articles
            })
        } else {
            res.send('article is not exist!');
        }

    });
});

module.exports = router;