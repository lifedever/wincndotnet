/**
 * 系统详细配置信息
 */

module.exports = {
    site: {
        title: 'WincnDEV',
        description: '开源、分享，专注开发，用Coding创造财富',
        version: '1.2.0'
    },
    db: {
        cookieSecret: 'blogbynodesecret',
        url: 'mongodb://127.0.0.1:27017/wincndotnet'
    },
    constant: {
        flash: {
            success: 'success',
            error: 'error'
        },
        cookie: {
            user: 'connectId'
        }
    },
    // 图灵机器人配置信息
    tl: {
        api: 'http://www.tuling123.com/openapi/api',
        key: '080cb4400d17375660c8b49e25994125'
    },
    wx: {
        load: true,
        noSkill: "没有此技能，请关注网站: http://wincn.net了解更多!"
    },
    role: {
        user: 'user',
        admin: 'admin'
    }
};
