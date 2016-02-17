var superagent = require('superagent');
var cheerio = require('cheerio');
var _ = require('lodash');

var Article = require('../model/article.model');

module.exports = {
    saveArticle: function (article, callback) {
        Article.create(article, callback);
    },
    findById: function (id, callback) {
        Article.findById(id, callback);
    },
    findAll: function (callback) {
        Article.find().populate(['_user']).sort({status: 1, created_at: -1}).exec(callback);
    },
    updateById: function (id, params, callback) {
        Article.update({_id: id}, params, callback);
    },
    deleteById: function (id, callback) {
        Article.remove({_id: id}, callback);
    },
    deleteByUserId: function (userId) {
        Article.find({_user: userId}, function (err, articles) {
            for (var i = 0; i < articles.length; i++) {
                articles[i].remove();
            }
        });
    },
    parseUrl: function (url, callback) {
        superagent.get(url).end(function (err, res) {
            if (err) {
                callback(err);
                return;
            }
            var model = {};
            var $ = cheerio.load(res.text);
            var title = _.trim($('title').text());
            if (title.indexOf('-') > 0) {
                var strs = _.split(title, '-');
                model.title = _.trim(title.substr(0, title.lastIndexOf('-') - 1));
                model.source = _.trim(_.last(strs));
            } else {
                model.title = _.trim(title);
            }
            callback(null, model);
        })
    }
};