var mongoose = require('mongoose');
var utils = require('utility');

var config = require('../config');

var Schema = mongoose.Schema;

/**
 * 信息自动回复
 * @private
 */
var _getRobot = function () {
    var robotSchema = new Schema({
        key: {type: String, required: true, unique: true},
        value: {type: String, required: true}
    }, {
        timestamps: {
            createdAt: 'created_at',
            updatedAt: 'updated_at'
        }
    });
    var robot = mongoose.model('Robot', robotSchema);
    return robot;
};

module.exports = _getRobot();