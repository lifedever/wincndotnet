<div class="box box-solid box-default">
    <div class="box-header with-border">
        <b> <i class="fa fa-tags"></i> 标签</b>
    </div>
    <div class="box-body">
        {% autoescape %}
            {{ tags |tags }}
        {% endautoescape %}
    </div>
</div>