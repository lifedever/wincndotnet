var mongoose = require('mongoose');
var utils = require('utility');

var config = require('../config');

var Schema = mongoose.Schema;

var _getUser = function () {
    /* 用户定义 */
    var userSchema = new Schema({
        username: {type: String, required: true, unique: true},// 用户名
        password: {type: String, required: true},
        role: {type: String, default: config.role.user}, // 角色：admin、user，默认为'user'
        email: {type: String},  // 邮箱
        website: {type: String},    // 个人网站
        weibo: {type: String},      // 个人微博
        address: {type: String},    // 所在地点
        github: {type: String}, // Github
        signature: {type: String},  // 个人签名
        job: {type: String},         // 职业
        inviteCode: {type: String},     // 注册码
        status: {type: Boolean, default: true}  // 用户是否有效
    }, {
        timestamps: {
            createdAt: 'created_at',
            updatedAt: 'updated_at'
        }
    });
    userSchema.methods.validPassword = function (password) {
        return utils.md5(password, 'base64') == this.password;
    };
    return mongoose.model('User', userSchema);
};

module.exports = _getUser();