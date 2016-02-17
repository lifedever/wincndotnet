var WX = require('../model/wx.model');
var Robot = require('../model/robot.model');

module.exports = {
    find: function (callback) {
        WX.find().exec(callback);
    },
    findRobot: function(params, callback) {
        Robot.find(params).exec(callback);
    },
    findOneRobot: function(params, callback) {
        Robot.findOne(params).exec(callback);
    },
    createRobot: function(robot, callback){
        Robot.create(robot, callback);
    },
    removeRobot: function(parmas, callback) {
        Robot.remove(parmas, callback);
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