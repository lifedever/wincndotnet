<div class="box box-default box-solid">
    <div class="box-header with-border">
        <i class="fa fa-user"></i> 分享者信息
    </div>
    <div class="box-body box-profile">
        <img class="profile-user-img img-responsive img-circle" style="border: 0px;"
             src="{{ user.email | gravatar }}" alt="User profile picture">

        <h3 class="profile-username text-center">{{ user.username }}</h3>

        <p class="text-muted text-center">{{ user.job }}</p>
        <p class="text-center">
            <small>于 <b>{{ user.created_at | timeFromNow }}</b> 加入本站</small>
        </p>
        <dl>
            <dt><i class="fa fa-home"></i> Home:</dt>
            <dd><a href="{{ user.website }}">{{ user.website }}</a></dd>
            <dt><i class="fa fa-github"></i> Github:</dt>
            <dd><a href="{{ user.github }}">{{ user.github }}</a></dd>
            <dt><i class="fa fa-weibo"></i> Weibo:</dt>
            <dd><a href="{{ user.weibo }}">{{ user.weibo }}</a></dd>
            <dt><i class="fa fa-envelope"></i> Email: </dt>
            <dd><a href="mailto: {{ user.email }}">{{ user.email }}</a></dd>
        </dl>
    </div>
    <div class="box-footer">
        <a href="/u/{{ user.username }}" class="btn btn-link btn-block text-primary"><b>查看{{ user.username }}分享的所有文章</b></a>
    </div>
</div>