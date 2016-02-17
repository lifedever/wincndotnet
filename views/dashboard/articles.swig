{% extends '../layouts/dashboard.swig' %}
{% block dashboard-content %}
<table class="table table-hover">
    <thead>
    <tr>
        <th width="80">序号</th>
        <th width="60">状态</th>
        <th width="100">作者</th>
        <th width="300">标题</th>
        <th width="300">链接</th>
        <th width="150">创建时间</th>
        <th width="200">操作</th>
    </tr>
    </thead>
    <tbody>
    {% for a in articles %}
    <tr>
        <td>{{ loop.index }}</td>
        <th>{% autoescape %}{{ a.status | articleStatus}}{% endautoescape %}</th>
        <td>{{ a._user.username }}</td>
        <td>{{ a.title }}</td>
        <td><a href="{{ a.url }}" target="_blank">{{ a.url }}</a></td>
        <td>{{ a.created_at | timeFromNow }}</td>
        <td>
            {% if a.status %}
                <a href="/dashboard/articles/publish/{{ a.id }}/false" class="btn btn-sm btn-warning">停止发布</a>
            {% else %}
                <a href="/dashboard/articles/publish/{{ a.id }}/true" class="btn btn-sm btn-primary">发布</a>
                <a href="/dashboard/articles/delete/{{ a.id }}" class="btn btn-sm btn-danger" data-toggle="confirm" data-message="确认删除吗?">删除</a>
            {% endif %}
        </td>
    </tr>
    {% endfor %}
    </tbody>
</table>
{% endblock %}