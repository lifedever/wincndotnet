<li class="media article  margin5-r" data-toggle="hover" data-target="#hover_{{ article.id }}">
    <div class="media-left">
        <a href="#">
        </a>
    </div>
    <div class="media-body">
        <h4 class="media-heading">
            {% include 'index-item-title.swig' %}
            {% if session.user %}
                {% if favorites.indexOf(article.id) > -1 %}
                    <small class="pull-right" title="已收藏" data-toggle="tooltip" data-toggle="tooltip">
                        <i class="fa fa-bookmark text-red"></i> {{ article.favorite_count }}
                    </small>
                {% else %}
                    <a href="/user/favorite/{{ article.id }}" data-toggle="tooltip" title="添加收藏"
                       data-toggle="tooltip"
                       class="pull-right p-favorite">
                        <small>
                            <i class="fa fa-bookmark-o text-red"></i> {{ article.favorite_count }}
                        </small>
                    </a>
                {% endif %}
            {% else %}
                <a href="/login" title="登录以收藏" data-toggle="tooltip"
                   class="pull-right">
                    <small>
                        <i class="fa fa-bookmark-o text-red"></i> {{ article.favorite_count }}
                    </small>
                </a>
            {% endif %}
        </h4>
        {% include 'index-item-desc.swig' %}
        {% include 'index-popover.swig' %}
    </div>
</li>