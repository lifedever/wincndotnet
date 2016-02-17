{% extends 'index.swig' %}
{% block content %}
    <div class="container" >
        <div class="row">
            <div class="col-md-12">
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <ul class="nav nav-pills">
                            <li role="presentation" class="active"><a href="#">用户管理</a></li>
                            <li role="presentation"><a href="#">文章管理</a></li>
                        </ul>
                    </div>
                    <div class="box-body">
                        {% block dashboard-content %}
                        {% endblock %}
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endblock %}