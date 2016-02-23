{% extends '../layouts/dashboard.swig' %}
{% block dashboard-content %}
<table class="table table-hover">
    <thead>
    <tr>
        <th width="60">序号</th>
        <th>用户名</th>
        <th width="200">注册时间</th>
        <th width="200">操作</th>
    </tr>
    </thead>
    <tbody>
    {% for u in users %}
        <tr>
            <td>{{ loop.index }}</td>
            <td>{{ u.username }}</td>
            <td>{{ u.created_at | timeFromNow }}</td>
            <td>
                {% if u.role != 'admin' %}
                    <a href="/dashboard/u/delete/{{ u.id }}" class="btn btn-sm btn-danger" data-toggle="confirm"
                       data-message="确认要删除此用户吗? 注意: 与此用户有关的内容会一并删除!">删除</a>
                {% endif %}
            </td>
        </tr>
    {% endfor %}
    </tbody>
</table>
{% endblock %}