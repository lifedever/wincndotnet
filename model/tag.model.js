var mongoose = require('mongoose');
var utils = require('utility');

var config = require('../config');

var Schema = mongoose.Schema;

var _getTag = function () {
    var tagSchema = new Schema({
        name: {type: String, required: true},   // 标签名称
        url: {type: String},                    // 相关链接
        summary: {type: String}                 // 标签简介
    }, {
        timestamps: {
            createdAt: 'created_at',
            updatedAt: 'updated_at'
        }
    });
    return mongoose.model('Tag', tagSchema);
};

module.exports = _getTag();