<!DOCTYPE html>
<html>
{% include 'partials/head.swig' %}
<body class="wrapper">
{% include 'partials/nav.swig' %}
<div class="main">
    {% block content %}
    {% endblock %}

    {#<a class="btn btn-app bg-red btn-share" href="/user/share">
        <i class="fa fa-edit"></i> 创建分享
    </a>#}

    <div class="load-article "><i class="fa fa-spinner"></i> 内容加载中...</div>

    <div class="share" title="创建分享" data-toggle="tooltip">
        <a href="/user/share"><i class="fa fa-edit"></i></a>
    </div>
</div>
{% include 'partials/footer.swig' %}
{% include 'partials/js.swig' %}
<script id="dsq-count-scr" src="//wincndev.disqus.com/count.js" async></script>
{% block js %}
<script>
    $('[data-toggle="tooltip"]').tooltip();
</script>
</body>
</html>
