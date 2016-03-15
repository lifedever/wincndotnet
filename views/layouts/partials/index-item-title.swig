{% if article.up %}
    <span class="label label-primary">置顶</span>
{% endif %}
            {% if article.views > 100 %}
                <i class="fa fa-fire text-red" title="被很多用户查阅"></i>
            {% endif %}
<a href="/p/{{ article.id }}" class="article-title" data-id="{{ article.id }}">{{ article.title }} </a>
<small class="hide" id="hover_{{ article.id }}">
    <a href="{{ article.url }}" target="_blank" class="link-black" title="直接查看原文">
        <i class="fa fa-link"></i>
    </a>
</small>