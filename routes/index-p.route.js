var express = require('express');

var router = express.Router();

var articleService = require('../service/article.service');

router.get('/:id', function (req, res, next) {
    var article = articleService.findById(req.params.id, function (err, article) {
        if (err) {
            next(err);
        } else {
            if (article) {
                article.views += 1;
                articleService.updateById(req.params.id, {views: article.views}, function (err, raw) {
                    res.redirect(article.url);
                });
            } else {
                res.send('article is not exist!');
            }
        }
    });
});

router.get('/data/json', function (req, res, next) {
    var page = req.query.page;

    articleService.findPublished(1 * page, 1, function (err, articles) {
        res.render('articles-json', {
            articles: articles
        })
    });
});

module.exports = router;