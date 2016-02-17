var mongoose = require('mongoose');
var Schema = mongoose.Schema;

/**
 * 微信定义
 * @returns {*|Model|Aggregate}
 * @private
 */
var _getWX = function () {
    var wxSchema = new Schema({
        token: {type: String},
        appid: {type: String},
        appSecret: {type: String},
        encodingAESKey: {type: String}
    });

    var WX = mongoose.model('WX', wxSchema);
    return WX;
};

module.exports = _getWX();