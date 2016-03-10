{% extends '../layouts/dashboard.swig' %}
{% block dashboard-header %}
<div class="pad"><div class="pull-left">已有标签列表：</div><div class="pull-left">{% autoescape %}{{ tags |tags }}{% endautoescape %}</div></div>
{% endblock %}
{% block dashboard-content %}
<table class="table table-hover">
    <thead>
    <tr>
        <th width="80">序号</th>
        <th width="60">状态</th>
        <th width="100">作者</th>
        <th width="300">标题</th>
        <th width="200">标签</th>
        <th width="150">创建时间</th>
        <th width="200">操作</th>
    </tr>
    </thead>
    <tbody>
    {% for a in articles %}
        <tr>
            <td>{{ loop.index }}</td>
            <th>{% autoescape %}{{ a.status | articleStatus }}{% endautoescape %}</th>
            <td>{{ a._user.username }}</td>
            <td>
                {% if a.up %}
                    <span class="label label-primary">置顶</span>
                {% endif %}
                <a href="{{ a.url }}" target="_blank">{{ a.title }}</a>
            </td>
            <td>{% autoescape %}{{ a.tags | tags }}{% endautoescape %}</td>
            <td>{{ a.created_at | timeFromNow }}</td>
            <td>
                <div class="btn-group">
                    <a href="/user/share?id={{ a.id }}" class="btn btn-sm btn-primary" title="编辑" data-toggle="tooltip"><i class="fa fa-edit"></i></a>
                    {% if a.status %}
                        <a href="/dashboard/articles/publish/{{ a.id }}/false" class="btn btn-sm btn-warning">停止发布</a>
                        <a href="/dashboard/articles/up/{{a.id}}?up={{a.up}}" class="btn btn-sm btn-adn" title="置顶" data-toggle="tooltip"><i class="fa fa-thumb-tack"></i></a>
                    {% else %}
                        <a href="/dashboard/articles/publish/{{ a.id }}/true" class="btn btn-sm btn-success">发布</a>
                        <a href="/dashboard/articles/delete/{{ a.id }}" class="btn btn-sm btn-danger" data-toggle="confirm"
                           data-message="确认删除吗?"><i class="fa fa-trash" title="删除" data-toggle="tooltip"></i></a>
                    {% endif %}
                </div>
            </td>
        </tr>
    {% endfor %}
    </tbody>
</table>
{% endblock %}