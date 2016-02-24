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

