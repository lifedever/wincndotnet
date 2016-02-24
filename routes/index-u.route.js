/**
 * Created by gefangshuai on 2016/2/17.
 */
var express = require('express');
var async = require('async');

var config = require('../config');
var userService = require('../service/user.service');
var articleService = require('../service/article.service');

var router = express.Router();

router.get('/:username', function (req, res, next) {
    var username = req.params.username;
    userService.findUserByUsername(username, function (err, user) {
        if (err) {
            next(err);
        } else {
            async.parallel({
                articles: function (callback) {
                    articleService.findPublishedAll({_user: user._id}, callback);
                },
                tags: function (callback) {
                    articleService.findTags(callback);
                },
                user: function (callback) {
                    if (req.session.user)
                        userService.findById(req.session.user._id, callback);
                    else {
                        callback(null, {favorites: null});
                    }
                }
            }, function (err, results) {
                res.render('users', {
                    articles: results.articles,
                    favorites: results.user.favorites,
                    user: user,
                    tags: results.tags
                });
            });
        }
    });
});

module.exports = router;