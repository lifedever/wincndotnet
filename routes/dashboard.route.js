/**
 * Created by gefangshuai on 2016/2/17.
 */

var express = require('express');
var async = require('async');
var router = express.Router();

var config = require('../config');
var userService = require('../service/user.service');

router.get('/', function (req, res) {
    res.render('dashboard/index');
});

module.exports = router;