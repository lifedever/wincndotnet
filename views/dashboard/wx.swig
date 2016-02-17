{% extends '../layouts/dashboard.swig' %}
{% block dashboard-content %}
<div class="row">
    <div class="col-md-12">
        <form class="form-inline margin" method="post">
            <div class="form-group">
                <label for="key">标识</label>
                <input type="text" class="form-control" id="key" name="key">
            </div>
            <div class="form-group">
                <label for="value">  规则</label>
                <input type="text" class="form-control" style="width: 500px;" id="value" name="value">
            </div>
            <button type="submit" class="btn btn-primary">添加</button>
        </form>
    </div>
    <div class="col-md-12">
        <table class="table table-hover">
            <thead>
            <tr>
                <th width="120">标识</th>
                <th>规则</th>
                <th width="120">操作</th>
            </tr>
            </thead>
            <tbody>
            {% for robot in robots %}
                <tr>
                    <td>{{ robot.key }}</td>
                    <td>{{ robot.value }}</td>
                    <td><a href="/dashboard/wx/delete/{{ robot.id }}" class="btn btn-danger btn-sm"
                           data-toggle="confirm" data-message="确认删除此规则吗">删除</a></td>
                </tr>
            {% endfor %}
            </tbody>
        </table>
    </div>
</div>
{% endblock %}