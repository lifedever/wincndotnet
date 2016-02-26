<script src="/js/jquery.min.js"></script>
<script src="/js/app.min.js"></script>
<script src="/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="/lib/toastr/toastr.js"></script>
<script>
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-center",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "500",
        "timeOut": "3000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };

    {% if success.length > 0 %}
    toastr.success('{{ success }}');
    {% endif %}
    {% if error.length > 0 %}
    toastr.error('{{ error }}');
    {% endif %}


</script>