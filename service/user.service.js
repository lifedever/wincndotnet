var User = require('../model/user.model');

module.exports = {
    findUserByUsername: function(username, callback) {
        User.findOne({username: username}).exec(callback);
    },
    findUserByEmail: function(email, callback) {
        User.findOne({email: user.email}).exec(callback);
    }
};