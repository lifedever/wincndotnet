var moment = require('moment');
var gravatar = require('gravatar');
var lodash = require('lodash');
var articleService = require('../service/article.service');

'use strict';

moment.locale('zh-cn');

module.exports = function (swig) {
    swig.setFilter('timeFromNow', function (input) {
        return moment(input).fromNow()
    });
    swig.setFilter('articleStatus', function (input) {
        if (input) {
            return '<span class="label label-primary">已发布</span>'
        } else {
            return '<span class="label label-danger">未发布</span>'
        }
    });
    swig.setFilter('tags', function (input) {
        var tags = articleService.getTags(input);
        var html = '';
        for (var i = 0; i < tags.length; i++) {
            html += '<span class="label bg-olive margin5-r">' + tags[i] + '</span>';
        }
        return html;
    })
};