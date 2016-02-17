var WX = require('../model/wx.model');

module.exports = {
    find: function (callback) {
        WX.find().exec(callback);
    },
    save: function (wx, callback) {
        if (wx.id == '') {
            WX.create({
                token: wx.token,
                appid: wx.appid,
                appSecret: wx.appSecret,
                encodingAESKey: wx.encodingAESKey
            }, callback);
        } else {
            WX.update({_id: wx.id}, {
                token: wx.token,
                appid: wx.appid,
                appSecret: wx.appSecret,
                encodingAESKey: wx.encodingAESKey
            }).exec(callback);
        }
    }
};