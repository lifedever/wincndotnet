var utils = require('utility');

var Tag = require('../model/tag.model');

module.exports = {
    findTag: function (tag, callback) {
        Tag.findOne({name: tag}).exec(callback);
    },
    updateById: function (id, params, callback) {
        Tag.update({_id: id}, params, callback);
    },
    save: function (article, callback) {
        Tag.create(article, callback);
    }
};