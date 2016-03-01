{% extends '../layouts/index.swig' %}
{% block content %}
    <div class="container" id="app">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-solid ">
                    <div class="box-header with-border">
                        <div class="box-title">
                            <i class="fa fa-user"></i>
                            个人中心
                        </div>
                    </div>
                    <div class="box-body">
                        <form method="post" class="form-horizontal">
                            <div class="form-group">
                                <label for="username" class="col-sm-2 control-label">用户名</label>

                                <div class="col-sm-7">
                                    <input class="form-control" id="username" value="{{user.username}}" placeholder="用户名" type="text" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-7">
                                    <input class="form-control" id="email" value="{{user.email}}" placeholder="邮箱" type="email" disabled>
                                    <div class="help-block">用于头像展示，更多请移步 <a target="_blank" href="http://cn.gravatar.com/">Gravatar</a> </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="website" class="col-sm-2 control-label">个人站点</label>

                                <div class="col-sm-7">
                                    <input class="form-control" id="website" value="{{user.website}}" name="website" placeholder="个人站点" type="text" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="address" class="col-sm-2 control-label">所在地点</label>

                                <div class="col-sm-7">
                                    <input class="form-control" id="address" value="{{user.address}}" name="address"  placeholder="所在地点" type="text" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address" class="col-sm-2 control-label">职业</label>

                                <div class="col-sm-7">
                                    <input class="form-control" id="address" value="{{user.job}}" name="job"  placeholder="职业" type="text" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="github" class="col-sm-2 control-label">Github</label>

                                <div class="col-sm-7">
                                    <input class="form-control" id="github" value="{{user.github}}" name="github" placeholder="Github" type="text" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="github" class="col-sm-2 control-label">微博地址</label>

                                <div class="col-sm-7">
                                    <input class="form-control" id="github" value="{{user.weibo}}" name="weibo" placeholder="微博" type="text" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="signature" class="col-sm-2 control-label">个人签名</label>

                                <div class="col-sm-7">
                                    <input class="form-control" id="signature" value="{{user.signature}}" name="signature" placeholder="个人签名" type="text" >
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-7">
                                    <button type="submit" class="btn btn-primary">保存信息</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endblock %}
