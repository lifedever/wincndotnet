{% extends 'layouts/index.swig' %}
{% block content %}
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="box box-solid box-default">
                    <div class="box-header with-border">
                        <i class="fa fa-tag"></i> 包含标签 <span class="text-danger h3"> <b>{{ tagName }}</b> </span> 的所有文章
                        <small class="text-blue font-12">共{{ articles.length }}篇</small>
                    </div>
                    <div class="box-body help-block">
                        {{ tag.summary }}
                    </div>
                    <div class="box-footer text-right">
                        <small>
                            <a href="{{ tag.url }}" target="_blank">查看更多关于 <b class="text-red">{{ tagName }}</b> 的介绍</a>
                        </small>
                    </div>
                </div>
                <div class="box box-solid box-default">
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