{% extends 'layouts/index.swig' %}
{% block content %}
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="box box-solid box-default">
                    <div class="box-header with-border">
                        <div class="box-title">
                            <i class="fa fa-bookmark text-red"></i> 我的收藏
                            <small class="text-blue font-12">共{{ articles.length }}篇</small>
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

                                                <small>
                                                    <a href="/user/{{ session.user.username }}/favorite/remove/{{ article.id }}" data-toggle="confirm" data-message="确认取消收藏吗？" class="pull-right small text-red">取消收藏</a>
                                                </small>
                                                
                                            </h4>
                                            <small>
                                                <i class="fa fa-user"></i>
                                                <a href="/u/{{ article._user.username }}">
                                                    <b>{{ article._user.username }}</b>
                                                </a>
                                                分享于 {{ article.created_at | timeFromNow }}
                                                •
                                                {{ article.views }} 次浏览
                                                {% if article.tags.length>0 %}
                                                    •
                                                    <i class="fa fa-tags"></i>
                                                    {% autoescape %}
                                                        {{ article.tags | tags }}
                                                    {% endautoescape %}
                                                {% endif %}

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

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                {% include 'layouts/sidebar/about.swig' %}
                {% include 'layouts/sidebar/weixin.swig' %}
                {% include 'layouts/sidebar/tags.swig' %}
            </div>
        </div>
    </div>
{% endblock %}