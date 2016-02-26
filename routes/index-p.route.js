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
        }
    ], function (err, article) {
        if (err) {
            next(err);
        } else if (article) {
            res.render('user/view', {
                article: article
            })

        } else {
            res.send('article is not exist!');
        }

    });

});

module.exports = router;