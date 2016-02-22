var express = require('express');

var router = express.Router();

var articleService = require('../service/article.service');
var config = require('../config');

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

    if(article.id){
        articleService.updateById(article.id, article, function (err, article) {
            if (err) {
                next(err);
            } else {
                req.flash(config.constant.flash.success, '编辑成功!');
                res.redirect('/dashboard/articles');
            }
        });
    }else{
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