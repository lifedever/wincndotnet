<small>
    {% if article.tags.length>0 %}
        {% autoescape %}
            {{ article.tags | tags }}
        {% endautoescape %}
        •
    {% endif %}

    <i class="fa fa-user"></i>
    <a href="/u/{{ article._user.username }}">
        <b>{{ article._user.username }}</b>
    </a>
    分享于 {{ article.created_at | timeFromNow }}
    •
    {{ article.views }} 次浏览
    •
    <a href="/p/{{ article.id }}#ds-comments">
        <span class="ds-thread-count" data-thread-key="{{ article.id }}" data-count-type="comments"></span> 次评论
    </a>


</small>
<small class="pull-right font-12">来自
    <a href="/source/{{ article.source }}">
        <span class="text-primary">{{ article.source }}</span>
    </a>
</small>