<div class="box box-solid ">
    <div class="box-header with-border">
        <div class="box-title"><b> <i class="fa fa-tags"></i> 标签</b></div>
    </div>
    <div class="box-body">
        {% autoescape %}
            {{ tags |tags }}
        {% endautoescape %}
    </div>
</div>