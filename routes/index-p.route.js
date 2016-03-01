var express = require('express');
var async = require('async');
var lodash = require('lodash');

var router = express.Router();

var articleService = require('../service/article.service');

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
        }
    ], function (err, article, articles) {
        if (err) {
            next(err);
        } else if (article) {
            res.render('user/view', {
                article: article,
                user: article._user,
                articles: articles
            })
        } else {
            res.send('article is not exist!');
        }

    });

});

module.exports = router;