{% extends 'layouts/index.swig' %}
{% block content %}
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="box  box-solid">
                    <div class="box-body box-profile">
                        <img class="profile-user-img img-responsive img-circle" style="border: 0px;"
                             src="{{ user.email | gravatar }}" alt="User profile picture">

                        <h3 class="profile-username text-center">{{ user.username }}</h3>

                        <p class="text-muted text-center">{{ user.job }}</p>
                        <p class="text-center">
                            <small>于 <b>{{ user.created_at | timeFromNow }}</b> 加入本站</small>
                        </p>
                        <ul class="list-unstyled">
                            <li><a class="help-block"><i class="fa fa-lg fa-map-marker"></i> {{ user.address }} </a></li>
                            <li><a class="help-block" href="{{ user.website }}"><i class="fa fa-lg fa-home"></i> {{ user.website }}</a></li>
                            <li><a class="help-block" href="{{ user.github }}"><i class="fa fa-lg fa-github"></i> {{ user.github }}</a></li>
                            <li><a class="help-block" href="{{ user.weibo }}"><i class="fa fa-lg fa-weibo"></i> {{ user.weibo }}</a></li>
                        </ul>
                    </div>
                </div>


                <div class="box box-solid box-default">
                    <div class="box-header with-border">分享的文章</div>
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

        </div>
    </div>
{% endblock %}