{% extends 'layouts/index.swig' %}
{% block content %}
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <div class="box-title">
                            分享列表
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
                                        <h4 class="media-heading"><a href="/p/{{ article.id }}" target="_blank">{{ article.title }}</a></h4>
                                        <small>
                                            <a href="/u/{{ article._user.username }}">
                                                <b>{{ article._user.username }}</b>
                                            </a>
                                            分享于 {{ article.created_at | timeFromNow }}
                                            |
                                            来自 <b>{{ article.source }}</b>
                                        </small>
                                    </div>
                                </li>
                            {% endfor %}
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endblock %}