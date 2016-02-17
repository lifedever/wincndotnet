/**
 * 系统详细配置信息
 */

module.exports = {
    site: {
        title: 'WincnDEV',
        description: '开源、分享，专注开发，用Coding创造财富',
        version: '1.0.1'
    },
    db: {
        cookieSecret: 'blogbynodesecret',
        url: 'mongodb://127.0.0.1:27017/wincndotnet'
    },
    constant: {
        flash: {
            success: 'success',
            error: 'error'
        }
    },
    role: {
        user: 'user',
        admin: 'admin'
    }
};