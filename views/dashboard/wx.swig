{% extends '../layouts/dashboard.swig' %}
{% block dashboard-content %}
<form class="form-horizontal" method="post">

    <input type="hidden" name="id" value="{{ wx.id }}">

    <div class="form-group">
        <label for="address" class="col-sm-2 control-label">Token</label>

        <div class="col-sm-9">
            <input class="form-control" id="Token" value="{{ wx.token }}" name="token"
                   placeholder="Token" type="text">
        </div>
    </div>
    <div class="form-group">
        <label for="AppId" class="col-sm-2 control-label">AppId</label>

        <div class="col-sm-9">
            <input class="form-control" id="AppId" value="{{ wx.appid }}" name="appid"
                   placeholder="AppId" type="text">
        </div>
    </div>

    <div class="form-group">
        <label for="AppSecret" class="col-sm-2 control-label">AppSecret</label>

        <div class="col-sm-9">
            <input class="form-control" id="EncodingAESKey" value="{{ wx.appSecret }}"
                   name="appSecret" placeholder="AppSecret" type="text">
        </div>
    </div>

    <div class="form-group">
        <label for="EncodingAESKey" class="col-sm-2 control-label">EncodingAESKey</label>

        <div class="col-sm-9">
            <input class="form-control" id="EncodingAESKey" value="{{ wx.encodingAESKey }}"
                   name="encodingAESKey" placeholder="EncodingAESKey" type="text">
        </div>
    </div>


    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-7">
            <button type="submit" class="btn btn-primary">保存信息</button>
        </div>
    </div>
</form>

{% endblock %}