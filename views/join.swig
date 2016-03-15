<html>

{% include 'layouts/partials/head.swig' %}

<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="/" class="text-red"><b>{{site.title}}</b></a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">注册一个账号，开启分享之旅! </p>
        <form action="/join" method="post">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="登录名" name="username" required>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="email" class="form-control" placeholder="邮箱" name="email" required>
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="密码" name="password" required>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="确认密码" name="confirm_password" required>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div id="captcha-box"></div>
                    <button type="submit" class="btn btn-primary btn-block btn-flat">注册</button>
                </div>
            </div>
        </form>

        <div class="social-auth-links text-center">
            <p>- OR -</p>
            <a href="/login" class="text-center btn btn-default btn-block btn-flat">登录</a>
        </div>
    </div>
</div>
{% include 'layouts/partials/js.swig' %}
<script src="http://api.geetest.com/get.php"></script>
<script>
    var captchaObj = new Geetest({
        gt: '8990504bd745255065b4cb49b5585efc',
        challenge: '{{ challenge }}'
    }); // 实例化，config为配置参数
    captchaObj.appendTo("#captcha-box"); // 绑定到id为captcha的元素上
    captchaObj.onSuccess(function () {
        // 成功回调
    });
    $('form').submit(function () {
        var result = captchaObj.getValidate(); // 获取成功后的验证信息，失败是返回false
        if(result){

        }else{
            return false;
        }
    });

</script>
</body>
</html>