<!DOCTYPE html>
<html>
{% include 'partials/head.swig' %}
<body class="wrapper">
{% include 'partials/nav.swig' %}
<div class="main">
    {% block content %}
    {% endblock %}
</div>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p class="pull-left">
                    &copy; 2015 - 2016 <b>WINCN.NET</b>
                </p>
                <p class="pull-right">
                    Version {{ site.version }}
                </p>
            </div>
            <div class="col-md-12">
                <p class="pull-left">

                    Build by <a href="https://nodejs.org/" target="_blank">Nodejs</a> + <a href="http://expressjs.com/"
                                                                                           target="_blank">Express</a>
                    |
                    <i class="fa fa-code-fork"></i> <a href="https://github.com/gefangshuai/wincndotnet"
                                                       target="_blank"> Fork me on Github</a>
                </p>

                <p class="pull-right">
                    <a href="https://www.digitalocean.com/?refcode=e188e648d051" target="_blank">DigitalOcean</a> 强力驱动
                    |
                    <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
                        document.write(unescape("%3Cspan id='cnzz_stat_icon_4141549'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s22.cnzz.com/stat.php%3Fid%3D4141549' type='text/javascript'%3E%3C/script%3E"));</script>
                </p>
            </div>
        </div>
    </div>
</footer>
{% include 'partials/js.swig' %}
<script id="dsq-count-scr" src="//wincndev.disqus.com/count.js" async></script>
{% block js %}
</body>
</html>
