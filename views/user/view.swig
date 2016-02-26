{% extends '../layouts/index.swig' %}
{% block content %}
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="box box-solid box-default">
                    <div class="box-header">
                        <a href="javascript: window.close()"> <i class="fa fa-reply"></i> 返回上一级</a>
                    </div>
                    <div class="box-body">
                        <h1 class="text-center page-header">
                            {{ article.title }}

                        </h1>
                        <p class="small  text-center">
                            <i class="fa fa-eye"> </i> {{ article.views }} 次浏览
                            <i class="fa fa-comments-o"> </i>
                            <a href="http://wincn.net/p/{{ article.id }}#disqus_thread"></a>
                        </p>
                        <p class="margin5-t">
                            原文链接： <a href="{{ article.url }}" target="_blank">{{ article.url }}</a>
                        </p>
                        <p>
                            <small> 来自: {{ article.source }}</small>
                        </p>

                    </div>
                    <div class="box-footer">
                        <div class="row ">
                            <div class="col-md-12">
                                <h5>Tags:</h5>
                                {% autoescape %}{{ article.tags | tags }}{% endautoescape %}
                            </div>
                        </div>
                    </div>
                </div>

                <div class="box box-solid box-default">
                    <div class="box-header">
                        <i class="fa fa-comment-o"></i> 添加评论
                    </div>
                    <div class="box-body">
                        <div id="disqus_thread"></div>
                    </div>
                </div>

            </div>
            <div class="col-md-3">
                <div class="box box-default box-solid">
                    <div class="box-header with-border">
                        <i class="fa fa-user"></i> 关于作者
                    </div>
                    <div class="box-body box-profile">
                        <img class="profile-user-img img-responsive img-circle" style="border: 0px;"
                             src="{{ article._user.email | gravatar }}" alt="User profile picture">

                        <h3 class="profile-username text-center">{{ article._user.username }}</h3>

                        <p class="text-muted text-center">Software Engineer</p>
                        <p class="text-center">
                            <small>于 <b>{{ article._user.created_at | timeFromNow }}</b> 加入本站</small>
                        </p>
                        {# <ul class="list-group list-group-unbordered">
                             <li class="list-group-item">
                                 <b>Followers</b> <a class="pull-right">1,322</a>
                             </li>
                             <li class="list-group-item">
                                 <b>Following</b> <a class="pull-right">543</a>
                             </li>
                             <li class="list-group-item">
                                 <b>Friends</b> <a class="pull-right">13,287</a>
                             </li>
                         </ul>
 #}
                    </div>
                    <div class="box-footer">
                        <a href="#" class="btn btn-primary btn-block"><b>查看{{ article._user.username }}发表的所有文章</b></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
{% endblock %}

{% block js %}
    <script>
        /**
         * RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
         * LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables
         */

        var disqus_config = function () {
            this.page.url = 'http://wincn.net/p/{{ article.id }}'; // Replace PAGE_URL with your page's canonical URL variable
            this.page.identifier = '{{ article.id }}'; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
        };

        (function () { // DON'T EDIT BELOW THIS LINE
            var d = document, s = d.createElement('script');

            s.src = '//wincndev.disqus.com/embed.js';

            s.setAttribute('data-timestamp', +new Date());
            (d.head || d.body).appendChild(s);
        })();
    </script>
    <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments
            powered by Disqus.</a></noscript>
{% endblock %}