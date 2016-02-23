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
                articleService.updateById(req.params.id, {views: article.views}, function(err, raw) {
                    res.redirect(article.url);
                });
            } else {
                res.send('article is not exist!');
            }
        }
    });
});

module.exports = router;