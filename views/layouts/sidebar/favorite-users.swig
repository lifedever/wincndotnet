{% if favoriteUsers %}
    <div class="box box-solid ">
        <div class="box-header with-border">
            <div class="box-title">{{ favoriteUsers.length }}人收藏了这篇文章</div>
        </div>
        <div class="box-body">
            {% for user in favoriteUsers %}
                <img class="direct-chat-img" src="{{ user.email | gravatar }}" alt="message user image">
            {% endfor %}
        </div>
    </div>
{% endif %}