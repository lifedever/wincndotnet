{% extends '../layouts/index.swig' %}
{% block content %}
  <div class="container">
    <div class="row">
      <div class="col-md-9">
        <div class="box box-solid box-default">
          <div class="box-header">
            <a href="javascript: history.go(-1)">
              <i class="fa fa-reply"></i>
              返回上一级
            </a>
          </div>
          <div class="box-body">
            <h1 class="text-center page-header">
              {{ article.title }}

            </h1>
            <p class="small  text-center">
              <i class="fa fa-user"></i>
              <b>{{ user.username }}</b>
              分享于
              {{ article.created_at | timeFromNow }}
              <i class="fa fa-eye"></i>
              {{ article.views }}
              次浏览
              <i class="fa fa-comments-o"></i>
              <a href="#ds-comments">
                <span class="ds-thread-count" data-thread-key="{{ article.id }}" data-count-type="comments"></span>
              </a>
              次评论
            </p>
            <p>
              <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
              <!-- 文章查看页广告 -->
              <ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-9785118418487965" data-ad-slot="1994284130" data-ad-format="auto"></ins>
              <script>
                (adsbygoogle = window.adsbygoogle || []).push({});
              </script>
            </p>

            <div class="direct-chat-msg">

              <!-- /.direct-chat-info -->
              <img class="direct-chat-img" src="{{ user.email | gravatar }}" alt="message user image">
              <!-- /.direct-chat-img -->
              <div class="direct-chat-text ">
                {% if article.summary %}
                  {{ article.summary }}
                {% else %}
                  分享者没有留下任何摘要，请直接点击
                  <b>
                    <a class="text-white" href="{{ article.url }}">查看原文</a>
                  </b>
                  获取文章内容
                {% endif %}
              </div>
              <!-- /.direct-chat-text -->
            </div>

            <p class="h4 margin-top">
              <b>获取文章详细内容，请点击
                <b>
                  <a href="{{ article.url }}" class="text-red read-source h3">查看原文</a>
                </b>
              </b>
            </p>

            <div class="border-bottom margin-top "></div>

            <div class="help-block small">
              <p class="margin5-t">
                原文:
                <a href="{{ article.url }}" target="_blank">{{ article.url }}</a>
              </p>
              <p>
                来自:
                <a href="/source/{{ article.source }}">{{ article.source }}</a>
              </p>
            </div>
            <p class="text-italic">
              <i class="fa fa-warning text-red"></i>
              文章版权归
              <b class="text-blue">{{ article.source }}</b>
              所有，转载请注明出处!</p>

            <div class="border-bottom margin"></div>
            {% if articles.length > 0 %}

              <dl>
                <dt>相关文章:</dt>
                {% for a in articles %}
                  <dd>
                    <a class="help-block" href="/p/{{ a.id }}">{{ loop.index }}.
                      {{ a.title }}</a>
                  </dd>
                {% endfor %}
              </dl>
            {% endif %}

            <div class="bdsharebuttonbox">
              <a href="#" class="bds_more" data-cmd="more"></a>
              <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
              <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
              <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
              <a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
              <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
              <a href="#" class="bds_copy" data-cmd="copy" title="分享到复制网址"></a>
            </div>
            <script>
              window._bd_share_config = {
                "common": {
                  "bdSnsKey": {},
                  "bdText": "",
                  "bdMini": "2",
                  "bdMiniList": false,
                  "bdPic": "",
                  "bdStyle": "1",
                  "bdSize": "24"
                },
                "share": {}
              };
              with (document)
                0 [(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~ (-new Date() / 36e5)];
            </script>

          </div>
          <div class="box-footer">
            <div class="row">
              <div class="col-md-12">
                <div class="pull-left margin-r-5">
                  <i class="fa fa-tags"></i>
                  标签:
                </div>
                <div class="pull-left">
                  {% autoescape %}{{ article.tags | tags }}{% endautoescape %}
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="box box-solid box-default" id="ds-comments">
          <div class="box-header">
            <i class="fa fa-comment"></i>
            添加评论
          </div>
          <div class="box-body">
            <div class="ds-thread" data-thread-key="{{ article.id }}" data-title="{{ article.title }}" data-url="http://wincn.net/p/{{ article.id }}"></div>
          </div>
        </div>

      </div>
      <div class="col-md-3">
        {% include '../layouts/sidebar/profile.swig' %}
        {% include '../layouts/sidebar/favorite-users.swig' %}
        {% include '../layouts/sidebar/weixin.swig' %}

      </div>
    </div>
  </div>
{% endblock %}

{% block js %}{% endblock %}
