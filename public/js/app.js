$('[data-toggle="confirm"]').on('click', function (e) {
    e.preventDefault();
    var $this = $(this);
    var msg = $this.data('message');
    if (confirm(msg)) {
        location.href = $this.attr('href');
    }
});


if ($('footer').length > 0) {
    var h = $(document).height() - $('div.main').height();
    var height = h > 120 ? h - 195 : 120;
    $('footer').css({marginTop: height});
}

$('.p-favorite').on('click', function (e) {
    e.preventDefault();
    var $this = $(this);
    if ($this.find('i').hasClass('fa-bookmark-o')) {
        $.get($this.attr('href'), function (data) {
            $this.attr('title', '已收藏');
            $this.find('i').removeClass('fa-bookmark-o').addClass('fa-bookmark');
            var count = Number($this.find('small').text());
            $this.find('small').html('<i class="fa fa-bookmark text-red"></i> ' + (count + 1));
            toastr.info(data);
        });
    }
});

$('[data-toggle="hover"]')
    .on('mouseover', function(){
    var $this = $(this);
    var target = $this.data('target');
    $(target).removeClass('hide');
}).on('mouseout', function(){
    var $this = $(this);
    var target = $this.data('target');
    $(target).addClass('hide');
});

//多说公共JS代码 start (一个网页只需插入一次)
var duoshuoQuery = {short_name:"gefangshuai"};
(function() {
    var ds = document.createElement('script');
    ds.type = 'text/javascript';ds.async = true;
    ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
    ds.charset = 'UTF-8';
    (document.getElementsByTagName('head')[0]
    || document.getElementsByTagName('body')[0]).appendChild(ds);
})();

