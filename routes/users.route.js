var express = require('express');

var router = express.Router();

var articleService = require('../service/article.service');
var config = require('../config');

/* GET users listing. */
router.get('/share', function (req, res, next) {
    res.render('user/share', {menu: 'share'});
});

router.post('/share', function (req, res, next) {
    var article = req.body;
    article._user = req.session.user._id;
    articleService.saveArticle(article, function(err, article) {
        if(err) {
            next(err);
        }else{
            req.flash(config.constant.flash.success, '分享成功，请耐心等待管理员审核!');
            res.redirect('/user/share');
        }
    })
});

router.get('/share/parseUrl', function (req, res, next) {
    var url = req.query.url;
    articleService.parseUrl(decodeURI(url), function(err, model) {
        res.send(model);
    });
});
module.exports = router;