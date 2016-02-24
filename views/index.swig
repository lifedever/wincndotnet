{% extends 'layouts/index.swig' %}
{% block content %}
    <div class="container">
    <div class="row">
    <div class="col-md-9">
    <div class="box box-solid box-default">
    <div class="box-header with-border">
        <div class="box-title">
            <i class="fa fa-rss"></i> 分享列表
            <small class="text-blue font-12">共{{ count }}篇</small>
        </div>
    </div>
    <div class="box-body">
    <ul class="media-list">
    {% if articles.length>0 %}
        {% for article in articles %}
            <li class="media article  margin5-r">
            <div class="media-left">
                <a href="#">
                </a>
            </div>
            <div class="media-body">
            <h4 class="media-heading">

            {% if article.up %}
                <span class="label label-primary">置顶</span>
            {% endif %}
            <a href="/p/{{ article.id }}" target="_blank">{{ article.title }}</a>

            {% if session.user %}

                {% if favorites.indexOf(article.id) > -1 %}
                    <small class="pull-right" title="已收藏" data-toggle="tooltip">
                        <i class="fa fa-heart text-red"></i>
                    </small>
                {% else %}
                    <a href="/user/favorite/{{ article.id }}" title="添加收藏" data-toggle="tooltip"
                       class="pull-right p-favorite">
                        <small>
                            <i class="fa fa-heart-o text-red"></i>
                        </small>
                    </a>
                {% endif %}

                {% else %}
                    <a href="/login" title="登录以收藏"
                       class="pull-right">
                        <small>
                            <i class="fa fa-heart-o text-red"></i>
                        </small>
                    </a>
                {% endif %}
                </h4>
                <small>

                    {% if article.tags.length>0 %}
                        {% autoescape %}
                            {{ article.tags | tags }}
                        {% endautoescape %}
                        •
                    {% endif %}

                    <a href="/u/{{ article._user.username }}">
                        <b>{{ article._user.username }}</b>
                    </a>
                    分享于 {{ article.created_at | timeFromNow }}
                    •
                    {{ article.views }} 次浏览


                </small>
                <small class="pull-right font-12">来自
                    <a href="/source/{{ article.source }}">
                        <span class="text-primary">{{ article.source }}</span>
                    </a>
                </small>
                </div>
                </li>
                {% endfor %}
            {% else %}
                <div class="text-danger text-center">已无更多记录!</div>
            {% endif %}
            </ul>
            </div>
            <div class="box-footer">
                {% if articles.length>0 %}
                    <a class="btn btn-block btn-default margin5-b" href="?page={{ page }}">下一页</a>
                {% else %}
                    <a class="btn btn-block btn-default margin5-b" href="javascript:history.go(-1)">返回</a>
                {% endif %}
            </div>
            </div>
            </div>
            <div class="col-md-3">
                {% include 'layouts/sidebar/weixin.swig' %}
                {% include 'layouts/sidebar/tags.swig' %}
            </div>
            </div>
            </div>
            {% endblock %}