var moment = require('moment');
var gravatar = require('gravatar');
var lodash = require('lodash');
var articleService = require('../service/article.service');

'use strict';

moment.locale('zh-cn');

module.exports = function (swig) {
    swig.setFilter('timeFromNow', function (input) {
        return moment(input).fromNow();
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
            html += '<code>' + '<a href="/tags/' + tags[i] + '"  data-tag="' + tags[i] + '">' + tags[i] + '</a>' + '</code>';
        }
        return html;
    });
    swig.setFilter('gravatar', function (email) {
        var url = gravatar.url(email);
        url = lodash.replace(url, 'www.gravatar.com', 'cn.gravatar.com');
        return url;
    });


};