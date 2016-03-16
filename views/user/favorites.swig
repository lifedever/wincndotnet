{% extends '../layouts/index.swig' %}
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
                                    <li class="media article  margin5-r" data-toggle="hover" data-target="#hover_{{ article.id }}">
                                        <div class="media-body">
                                            <h4 class="media-heading">
                                                {% include '../layouts/partials/index-item-title.swig' %}
                                                <small>
                                                    <a href="/user/{{ session.user.username }}/favorite/remove/{{ article.id }}"
                                                       data-toggle="confirm" data-message="确认取消收藏吗？" class="pull-right small text-red">
                                                        取消收藏
                                                    </a>
                                                </small>
                                            </h4>
                                            {% include '../layouts/partials/index-item-desc.swig' %}
                                            {% include '../layouts/partials/index-popover.swig' %}
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
                {% include '../layouts/sidebar/about.swig' %}
                {% include '../layouts/sidebar/weixin.swig' %}
                {% include '../layouts/sidebar/tags.swig' %}
            </div>
        </div>
    </div>
{% endblock %}