<html>

{% include 'layouts/partials/head.swig' %}

<body class="hold-transition register-page">
<div class="login-box">
    <div class="login-logo">
        <a href="/" class="text-red"><b>{{ site.title }}</b></a>
    </div>
    <div class="login-box-body">
        <p class="login-box-msg">账户登录</p>
        <form action="/login" method="post">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" name="username" placeholder="用户名" required>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name="password" placeholder="密码" required>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div id="captcha-box"></div>
            <button type="submit" class="btn btn-primary btn-block btn-flat" id="submitBtn">登 录</button>
        </form>

        <div class="social-auth-links text-center">
            <p>- OR -</p>
            <!--<a href="/join" class="btn btn-block btn-github">注册</a>-->
            <a href="/join" class="btn btn-block btn-default" id="registerBtn">注册</a>
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