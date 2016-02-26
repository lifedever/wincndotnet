<li class="media article  margin5-r">
    <div class="media-left">
        <a href="#">
        </a>
    </div>
    <div class="media-body">
        <h4 class="media-heading">

            {% if article.up %}
                <span class="label label-primary">置顶</span>
            {% endif %}
            {% if article.views > 100 %}
                <i class="fa fa-fire text-red" title="被很多用户查阅"></i>
            {% endif %}
            <a href="/p/{{ article.id }}#disqus_thread" target="_blank">{{ article.title }}</a>
            {# <a class="bds_more" data-cmd="more" style="cursor: pointer;">
                 <small><i class="fa fa-share-alt"></i></small>
             </a>#}


            {% if session.user %}

                {% if favorites.indexOf(article.id) > -1 %}
                    <small class="pull-right" title="已收藏" data-toggle="tooltip">
                        <i class="fa fa-bookmark text-red"></i> {{ article.favorite_count }}
                    </small>
                {% else %}
                    <a href="/user/favorite/{{ article.id }}" title="添加收藏"
                       data-toggle="tooltip"
                       class="pull-right p-favorite">
                        <small>
                            <i class="fa fa-bookmark-o text-red"></i> {{ article.favorite_count }}
                        </small>
                    </a>
                {% endif %}

            {% else %}
                <a href="/login" title="登录以收藏"
                   class="pull-right">
                    <small>
                        <i class="fa fa-bookmark-o text-red"></i> {{ article.favorite_count }}
                    </small>
                </a>
            {% endif %}
        </h4>
        <small>
            <i class="fa fa-user"></i>
            <a href="/u/{{ article._user.username }}">
                <b>{{ article._user.username }}</b>
            </a>
            分享于 {{ article.created_at | timeFromNow }}
            •
            {{ article.views }} 次浏览
            {% if article.tags.length>0 %}
                •
                <i class="fa fa-tags"></i>
                {% autoescape %}
                    {{ article.tags | tags }}
                {% endautoescape %}
            {% endif %}

        </small>
        <small class="pull-right font-12">来自
            <a href="/source/{{ article.source }}">
                <span class="text-primary">{{ article.source }}</span>
            </a>
        </small>
    </div>
</li>