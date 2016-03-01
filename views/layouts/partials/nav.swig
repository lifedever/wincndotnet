<nav class="navbar navbar-white navbar-fixed-top ">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <i class="fa fa-navicon"></i>
            </button>
            <a class="navbar-brand" href="/">
                <b>
                    {{ site.title }}
                </b>
                <div class="logo-beta">beta</div>
            </a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li {% if menu == underfind || menu == 'index' %}class="active" {% endif %}><a href="/">
                        分享列表
                        <span class="sr-only">(current)</span></a></li>

                {% if session.user %}
                    <li {% if menu == 'favorite' %}class="active" {% endif %}>
                        <a href="/user/{{ session.user.username }}/favorite">
                            <i class="fa fa-bookmark text-red"></i> 我收藏的
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                {% endif %}

                {% if menu == 'profile' %}
                    <li class="active">
                        <a href="/user/profile">
                            个人中心
                        </a>
                    </li>
                {% endif %}
                {% if menu == 'search' %}
                    <li class="active">
                        <a href="/search?q={{ key }}">
                            检索结果
                        </a>
                    </li>
                {% endif %}
            </ul>

            {% if session.user %}
                <ul class="nav navbar-nav navbar-right">
                    <li {% if menu == 'share' %}class="active" {% endif %} >
                        <a href="/user/share">
                            <i class="fa fa-edit"></i> 创建分享
                        </a>
                    </li>

                    {% if session.user.role == 'admin' %}
                        <li class="dropdown {% if menu == 'dashboard' %}active{% endif %}">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false"><i class="fa fa-dashboard"></i> 后台管理 <span
                                        class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/dashboard">用户管理</a></li>
                                <li><a href="/dashboard/articles">文章管理</a></li>
                                <li><a href="/dashboard/tags">标签管理</a></li>
                            </ul>
                        </li>
                    {% endif %}
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false"><i class="fa fa-user"></i> {{ session.user.username }} <span
                                    class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/user/profile">个人中心</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="/logout">退出</a></li>
                        </ul>
                    </li>
                </ul>
            {% else %}
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/login">登录</a></li>
                    <li><a href="/join">注册</a></li>
                </ul>
            {% endif %}
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-search hidden-xs">
                    <form class="navbar-form form-search active" action="/search" method="GET">
                        <div class="form-group">
                            <i class="fa btn-search fa-search"></i>
                            <input class="form-control" name="q" type="text" value="{{ key }}" placeholder="根据标题或标签检索">
                        </div>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>