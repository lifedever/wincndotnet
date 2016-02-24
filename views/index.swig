{% extends 'layouts/index.swig' %}
{% block content %}
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="box box-solid box-default">
                    <div class="box-header with-border">
                        <div class="box-title">
                            <i class="fa fa-rss"></i> 分享列表
                            <small class="text-blue font-12">共{{ articles.length }}篇</small>
                        </div>
                    </div>
                    <div class="box-body">
                        <ul class="media-list">
                            {% for article in articles %}
                                <li class="media article">
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
                                        <small class="pull-right font-12 margin5-r">来自
                                            <a href="/source/{{ article.source }}">
                                                <span class="text-primary">{{ article.source }}</span>
                                            </a>
                                        </small>
                                    </div>
                                </li>
                            {% endfor %}
                        </ul>
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