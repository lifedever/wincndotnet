<!DOCTYPE html>
<html>
{% include 'partials/head.swig' %}
<body class="wrapper">
{% include 'partials/nav.swig' %}
<div class="main">
    {% block content %}
    {% endblock %}

        <a class="btn btn-app bg-red" href="/user/share" style="position: fixed; bottom: 10px; right: 10px;">
            <i class="fa fa-edit"></i> 创建分享
        </a>    
</div>
{% include 'partials/footer.swig' %}
{% include 'partials/js.swig' %}
<script id="dsq-count-scr" src="//wincndev.disqus.com/count.js" async></script>
{% block js %}
</body>
</html>
