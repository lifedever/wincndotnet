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