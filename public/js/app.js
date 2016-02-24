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
    if ($this.find('i').hasClass('fa-heart-o')) {
        $.get($this.attr('href'), function (data) {
            $this.attr('title', '已收藏');
            $this.find('i').removeClass('fa-heart-o').addClass('fa-heart');
            var count = Number($this.find('small').text());
            $this.find('small').html('<i class="fa fa-heart text-red"></i> ' + (count + 1));
            toastr.info(data);
        });
    }
});