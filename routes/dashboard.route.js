/**
 * Created by gefangshuai on 2016/2/17.
 */

var express = require('express');
var async = require('async');
var router = express.Router();

var config = require('../config');
var userService = require('../service/user.service');
var articleService = require('../service/article.service');

/**
 * 后台首页，用户列表
 */
router.get('/', function (req, res) {
    userService.findAll(function (err, users) {
        res.render('dashboard/index',
            {
                menu: 'dashboard',
                subMenu: 'users',
                users: users
            }
        );
    });
});

router.get('/u/delete/:id', function (req, res, next) {
    var id = req.params.id;
    userService.deleteById(id, function (err, doc) {
        if(err) {
            next(err);
        }else{
            articleService.deleteByUserId(id);
            req.flash(config.constant.flash.success, '记录已删除!');
            res.redirect('/dashboard');
        }
    });
});

/**
 * 文章列表
 */
router.get('/articles', function (req, res) {
    articleService.findAll(function (err, articles) {
        res.render('dashboard/articles',
            {
                menu: 'dashboard',
                subMenu: 'articles',
                articles: articles
            }
        );
    });
});

/**
 * 文章发布或停止发布
 */
router.get('/articles/publish/:id/:status', function (req, res, next) {
    var id = req.params.id;
    var status = req.params.status;

    articleService.updateById(id, {status: status}, function(err, raw){
        if(err) {
            next(err);
        }else{
            res.redirect('/dashboard/articles');
        }
    });

});

/**
 * 文章删除
 */
router.get('/articles/delete/:id', function (req, res, next) {
    var id = req.params.id;
    articleService.deleteById(id, function (err, doc) {
        if(err) {
            next(err);
        }else{
            req.flash(config.constant.flash.success, '记录已删除!');
            res.redirect('/dashboard/articles');
        }
    });
});

module.exports = router;