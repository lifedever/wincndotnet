<form class="form-horizontal margin" method="post">
    <input type="hidden" name="id" value="{{ tag.id }}">
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">标签名称</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="name" readonly value="{{ tagName }}" name="name" required>
        </div>
    </div>
    <div class="form-group">
        <label for="summary" class="col-sm-2 control-label">标签简介</label>
        <div class="col-sm-8">
            <textarea rows="5" class="form-control" id="summary" name="summary" required>{{ tag.summary }}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="url" class="col-sm-2 control-label">相关链接</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="url" value="{{ tag.url }}" name="url" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-8">
            <button type="submit" class="btn btn-primary">保存</button>
        </div>
    </div>
</form>