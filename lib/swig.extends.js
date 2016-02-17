var moment = require('moment');
var gravatar = require('gravatar');
var lodash = require('lodash');

'use strict';

moment.locale('zh-cn');

module.exports = function (swig) {
    swig.setFilter('timeFromNow', function (input) {
        return moment(input).fromNow()
    });
    swig.setFilter('articleStatus', function(input) {
        if(input) {
            return '<span class="label label-primary">已发布</span>'
        }else{
            return '<span class="label label-danger">未发布</span>'
        }
    })
};