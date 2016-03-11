{% extends 'layouts/index.swig' %}
{% block content %}
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="panel">
                    <div class="panel-body">
                        <ul class="timeline">

                            {% for item in data %}

                                <li class="time-label">
                                    <span class="label bg-blue">
                                        {{ item._id.year }}年{{ item._id.month }}月
                                    </span>
                                </li>
                                {% for article in item.articles %}
                                    <li class="item">
                                        <div class="timeline-item">
                                            <span class="time"><i
                                                        class="fa fa-clock-o"></i> {{ article.created_at | timeFromNow }}</span>

                                            <h3 class="timeline-header no-border">
                                                <div class="pull-left margin5-r">
                                                    <b><a href="/source/{{ article.source }}" class="text-red">{{ article.source }}: </a></b>
                                                    <a href="{{ article.url }}">{{ article.title }}</a>
                                                </div>
                                                {% autoescape %}
                                                    <div class="pull-left">
                                                        <small>{{ article.tags | tags }}</small>
                                                    </div>
                                                {% endautoescape %}
                                            </h3>
                                        </div>
                                    </li>
                                {% endfor %}
                            {% endfor %}
                            <li>
                                <i class="fa fa-clock-o bg-gray"></i>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endblock %}