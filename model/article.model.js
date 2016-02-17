var mongoose = require('mongoose');
var utils = require('utility');

var config = require('../config');

var Schema = mongoose.Schema;

var _getArticle = function () {
    var articleSchema = new Schema({
        title: {type: String, required: true},   // 标题
        url: {type: String},                     // 相关链接
        source: {type: String},                  // 文章来源
        views: {type: Number, default: 0},       // 阅读数
        zan: {type: Number, default: 0},         // 点赞数
        _user: {
            type: Schema.Types.ObjectId,
            ref: 'User'
        },
        status: {type: Boolean, default: false}  // 文章是否发布
    }, {
        timestamps: {
            createdAt: 'created_at',
            updatedAt: 'updated_at'
        }
    });
    return mongoose.model('Article', articleSchema);
};

module.exports = _getArticle();