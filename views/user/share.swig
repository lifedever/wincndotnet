{% extends '../layouts/index.swig' %}
{% block content %}
    <div class="container" id="app">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-solid ">
                    <div class="box-header with-border">
                        <div class="box-title">
                            <i class="fa fa-share-alt"></i>
                            欢迎创建分享内容
                        </div>
                    </div>
                    <div class="box-body">
                        <form class="form-horizontal" method="post">
                            <input type="hidden" name="id" value="{{ article.id }}">
                            <div class="form-group">
                                <label for="url" class="col-sm-2 control-label">链接</label>
                                <div class="col-sm-8">
                                    <input type="url" class="form-control" id="url" name="url" required
                                           placeholder="eg: http://www.jianshu.com/p/027dedbc62d7" v-model="url"
                                           @blur="parseUrl" value="{{ article.url }}">
                                    <p class="help-block">系统会自动解析url相关信息, 帮助填写.</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="title" class="col-sm-2 control-label">标题</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="title" name="title" required
                                           placeholder="eg: 让WebStorm支持swig文件语法高亮" v-model="article.title"
                                           value="{{ article.title }}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="summary" class="col-sm-2 control-label">摘要</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" rows="4" name="summary" id="summary" placeholder="简单描述一下所分享内容的摘要，会给您带来更多的访问量" required>{{ article.summary }}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="source" class="col-sm-2 control-label">来源</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="source" name="source" required
                                           placeholder="eg: 简书" v-model="article.source" value="{{ article.source }}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="tags" class="col-sm-2 control-label">标签</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="articleTags"
                                           value="{{ article.tags }}" placeholder="逗号分隔" id="articleTags">
                                    <div class="margin5-t" id="tagsList">{% autoescape %}{{ tags |tags }}{% endautoescape %}</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary">提交分享</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endblock %}
{% block js %}
    <script src="/js/vue.min.js"></script>
    <script src="/js/vue-resource.min.js"></script>
    <script src="/js/share.min.js"></script>
{% endblock %}