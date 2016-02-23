/**
 * Created by gefangshuai on 2016/2/17.
 */

var express = require('express');
var async = require('async');
var router = express.Router();

var config = require('../config');
var userService = require('../service/user.service');
var articleService = require('../service/article.service');
var wxService = require('../service/wx.service');


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
        if (err) {
            next(err);
        } else {
            articleService.deleteByUserId(id);
            req.flash(config.constant.flash.success, '记录已删除!');
            res.redirect('/dashboard');
        }
    });
});

/**
 * 文章列表
 */
router.get('/articles', function (req, res, next) {
    async.parallel({
        articles: function (callback) {
            articleService.findAll(callback);
        },
        tags: function (callback) {
            articleService.findTags(callback);
        }
    }, function (err, results) {
        if (err) {
            next(err);
        } else {
            res.render('dashboard/articles',
                {
                    menu: 'dashboard',
                    subMenu: 'articles',
                    tags: results.tags,
                    articles: results.articles
                }
            );
        }
    })

});

/**
 * 文章发布或停止发布
 */
router.get('/articles/publish/:id/:status', function (req, res, next) {
    var id = req.params.id;
    var status = req.params.status;

    articleService.updateById(id, {status: status}, function (err, raw) {
        if (err) {
            next(err);
        } else {
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
        if (err) {
            next(err);
        } else {
            req.flash(config.constant.flash.success, '记录已删除!');
            res.redirect('/dashboard/articles');
        }
    });
});

router.get('/wx', function (req, res, next) {
    wxService.findRobot(function (err, robots) {
        if (err) {
            next(err);
        } else {
            res.render('dashboard/wx',
                {
                    menu: 'dashboard',
                    subMenu: 'wx',
                    robots: robots
                }
            );
        }
    })
});

router.post('/wx', function (req, res, next) {
    var robot = req.body;
    wxService.findRobot({key: robot.key}, function (err, doc) {
        if (err) {
            next(err);
        } else {
            if (doc.length == 0) {
                wxService.createRobot(robot, function (err, doc) {
                    if (err) {
                        next(err);
                    } else {
                        res.redirect('/dashboard/wx');
                    }
                });
            } else {
                req.flash(config.constant.flash.error, '规则已存在!');
                res.redirect('/dashboard/wx');
            }
        }
    });
});

router.get('/wx/delete/:id', function (req, res, next) {
    var id = req.params.id;
    wxService.removeRobot({_id: id}, function (err, doc) {
        res.redirect('/dashboard/wx');
    });
});

module.exports = router;