<div class="row margin5-t">
    <div class="col-md-12">
        <div class="box box-solid box-default box-popover" id="article-preview-{{ article.id }}" style="display: none;">
            <div class="box-body">
                {% if article.summary %}
                    {{ article.summary }}
                {% else %}
                    分享者没有留下任何摘要，请直接点击
                    <b>
                        <a class="text-red" href="{{ article.url }}">查看原文</a>
                    </b>
                    获取文章内容
                {% endif %}
            </div>
            <div class="box-footer">
                <div class="pull-left margin5-r">
                    <i class="fa fa-tags"></i> 标签:
                </div>
                <div>
                    {% autoescape %}
                        {{ article.tags | tags }}
                    {% endautoescape %}
                </div>
            </div>
        </div>
    </div>
</div>