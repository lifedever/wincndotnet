{% extends '../layouts/dashboard.swig' %}
{% block dashboard-header %}
    <i class="fa fa-smile-o"></i>点击标签名称进行编辑
{% endblock %}
{% block dashboard-content %}
<div class="row">
    <div class="col-md-12">
        {% for tag in tags %}
            <code ><a href="/dashboard/tags/{{ tag }}/edit" class="edit-code">{{ tag }}</a></code>
        {% endfor %}
    </div>
    <div class="col-md-12" id="tagForm">

    </div>
</div>
{% endblock %}

{% block js %}
    <script>
        $('a.edit-code').on('click', function (e) {
            e.preventDefault();
            var url = $(this).attr('href');
            $.get(url, function (data) {
                $('#tagForm').html(data);
            });
        });
    </script>
{% endblock %}