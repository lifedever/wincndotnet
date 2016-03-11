{% extends 'layouts/index.swig' %}
{% block content %}
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                {% include 'layouts/sidebar/special-column.swig' %}
                <div class="box box-solid box-default">
                    <div class="box-header with-border">
                        <div class="box-title">
                            <i class="fa fa-rss"></i> 所有分享列表
                            <small class="text-blue font-12">共{{ count }}篇</small>
                        </div>
                        <small class="text-red pull-right font-12">
                            <i class="fa fa-bell"></i>
                            觉得对自己有用的文章，可以先收藏起来供以后查阅哦~
                        </small>
                    </div>
                    <div class="box-body">
                        <ul class="media-list">
                            {% if articles.length>0 %}
                                {% for article in articles %}
                                    {% include 'layouts/partials/index-item.swig' %}
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
                {% include 'layouts/sidebar/about.swig' %}
                {% include 'layouts/sidebar/weixin.swig' %}
                {% include 'layouts/sidebar/tags.swig' %}
                {% include 'layouts/sidebar/visitor.swig' %}
            </div>
        </div>
    </div>
{% endblock %}