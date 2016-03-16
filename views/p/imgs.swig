<p><strong>预览图:</strong></p>
<div class="row">
    {% for img in imgs %}
        <div class="col-md-3">
            <a href="{{ img.url }}" class="thumbnail fancybox" style="height: 170px;">
                <img src="{{ img.url }}" alt="暂无预览" class="image" style="max-height: 150px;">
            </a>
        </div>
    {% endfor %}
</div>
<script>
    $('a.fancybox').fancybox();
</script>