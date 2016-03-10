{% extends '../layouts/index.swig' %}
{% block content %}
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="box box-solid box-default">
                    <div class="box-header">
                        <a href="javascript: history.go(-1)"> <i class="fa fa-reply"></i> 返回上一级</a>
                    </div>
                    <div class="box-body">
                        <h1 class="text-center page-header">
                            {{ article.title }}

                        </h1>
                        <p class="small  text-center">
                            <i class="fa fa-eye"> </i> {{ article.views }} 次浏览
                            <i class="fa fa-comments-o"> </i>
                            <span class="ds-thread-count" data-thread-key="{{ article.id }}"
                                  data-count-type="comments">
                            </span> 次评论
                        </p>

                        <p class="text-center h4">
                            <b> <i class="fa fa-bullhorn text-red"></i> 获取文章详细内容，请点击 <b class="h3 text-red read-source">查看原文</b></b>
                        </p>

                        <p class="margin5-t">
                            查看原文: <a href="{{ article.url }}" target="_blank">{{ article.url }}</a>
                        </p>
                        <p>
                            来自: <a href="/source/{{ article.source }}">{{ article.source }}</a>
                        </p>
                        {% if articles.length> 0 %}
                            <p>
                                <b><i class="fa fa-retweet"></i> 相关文章:</b>
                            </p>
                            <ul>
                                {% for a in articles %}
                                    <li><a href="/p/{{ a.id }}">{{ a.title }}</a></li>
                                {% endfor %}
                            </ul>
                        {% endif %}

                        <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#"
                                                                                                          class="bds_tsina"
                                                                                                          data-cmd="tsina"
                                                                                                          title="分享到新浪微博"></a><a
                                    href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#"
                                                                                                       class="bds_tqq"
                                                                                                       data-cmd="tqq"
                                                                                                       title="分享到腾讯微博"></a><a
                                    href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#"
                                                                                                        class="bds_weixin"
                                                                                                        data-cmd="weixin"
                                                                                                        title="分享到微信"></a><a
                                    href="#" class="bds_copy" data-cmd="copy" title="分享到复制网址"></a></div>
                        <script>window._bd_share_config = {
                                "common": {
                                    "bdSnsKey": {},
                                    "bdText": "",
                                    "bdMini": "2",
                                    "bdMiniList": false,
                                    "bdPic": "",
                                    "bdStyle": "1",
                                    "bdSize": "24"
                                }, "share": {}
                            };
                            with (document)0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>

                    </div>
                    <div class="box-footer">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="pull-left margin-r-5">
                                    <i class="fa fa-tags"></i> 标签:
                                </div>
                                <div class="pull-left">{% autoescape %}{{ article.tags | tags }}{% endautoescape %}</div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="box box-solid box-default" id="ds-comments">
                    <div class="box-header">
                        <i class="fa fa-comment"></i> 添加评论
                    </div>
                    <div class="box-body">
                        <div class="ds-thread" data-thread-key="{{ article.id }}" data-title="{{ article.title }}"
                             data-url="http://wincn.net/p/{{ article.id }}"></div>
                    </div>
                </div>

            </div>
            <div class="col-md-3">
                {% include '../layouts/sidebar/profile.swig' %}
                {% include '../layouts/sidebar/weixin.swig' %}

            </div>
        </div>
    </div>
{% endblock %}

{% block js %}

{% endblock %}