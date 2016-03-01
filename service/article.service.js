var superagent = require('superagent-charset');
var cheerio = require('cheerio');
var _ = require('lodash');
var async = require('async');
var Article = require('../model/article.model');


module.exports = {
    getTags: function (value) {
        return _.split(value, ',');
    },
    count: function (params, callback) {
        Article.count(params).exec(callback);
    },
    search: function (params, callback) {
        Article.find(params).exec(callback);
    },
    saveArticle: function (article, callback) {
        Article.create(article, callback);
    },
    findById: function (id, callback) {
        Article.findById(id, callback).populate(['_user']);
    },
    findAll: function (params, callback) {
        Article.find(params).populate(['_user']).sort({up: -1, status: 1, created_at: -1}).exec(callback);
    },
    findPublishedAll: function (params, callback) {
        params.status = true;
        Article
            .find(params)
            .populate(['_user'])
            .sort({up: -1, created_at: -1})
            .exec(callback);
    },
    findPublished: function (params, start, limit, callback) {
        params.status = true;
        Article
            .find(params)
            .populate(['_user'])
            .skip(start)
            .limit(limit)
            .sort({up: -1, created_at: -1})
            .exec(callback);
    },
    findTags: function (callback) {
        Article.find({}, {tags: 1}, function (err, articles) {
            var tags = new Array();
            _(articles).forEach(function (value) {
                tags = _.concat(tags, value.tags);
            });
            callback(err, _.uniq(tags));
        });
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
        if(url&&url.length > 0) {
            async.waterfall([
                    function (callback) {   // 动态获取网站编码
                        superagent.get(url).end(function (err, res) {
                            var charset = "utf-8";
                            var arr = res.text.match(/<meta([^>]*?)>/g);
                            if (arr) {
                                arr.forEach(function (val) {
                                    var match = val.match(/charset\s*=\s*(.+)\"/);
                                    if (match && match[1]) {
                                        if (match[1].substr(0, 1) == '"')match[1] = match[1].substr(1);
                                        charset = match[1].trim();
                                    }
                                })
                            }
                            callback(err, charset)
                        })
                    }, function (charset, callback) {   // 内容爬取
                        superagent
                            .get(url)
                            .charset(charset)
                            .end(function (err, res) {
                                if (err) {
                                    console.log(err);
                                    callback(err);
                                    return;
                                }
                                var model = {};
                                var $ = cheerio.load(res.text);
                                var title = _.trim($('title').text());
                                if (title.indexOf('-') > 0) {
                                    var strs = _.split(title, '-');
                                    model.title = _.trim(title.substr(0, title.lastIndexOf('-')));
                                    model.source = _.trim(_.last(strs));
                                } else {
                                    model.title = _.trim(title);
                                }
                                callback(err, model);
                            })
                    }
                ],
                function (err, model) {
                    callback(err, model);
                });
        }else{
            callback(err, null);
        }
    }
};