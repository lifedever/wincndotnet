new Vue({
    el: '#app',
    data: {
        article: {}
    },
    methods: {
        parseUrl: function (event) {
            var $this = this;
            this.$http.get('/user/share/parseUrl', {url: encodeURI(this.url)}).then(function (response) {
                $this.article = response.data
            }, function (response) {
                toastr.error(response);
            });
        }
    }
});
$('#tagsList a').on('click', function (e) {
    e.preventDefault();
    var $this = $(this);
    var $articleTags = $('#articleTags');
    if ($articleTags.val().indexOf($this.data('tag')) < 0) {
        if ($articleTags.val().length > 0) {
            $articleTags.val($articleTags.val() + ',' + $this.data('tag'));
        } else {
            $articleTags.val($this.data('tag'));
        }
    }
});