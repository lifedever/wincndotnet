<!DOCTYPE html>
<html>
{% include 'partials/head.swig' %}
<body class="wrapper">
{% include 'partials/nav.swig' %}
{% block content %}
{% endblock %}
{% include 'partials/js.swig' %}
{% block js %}
</body>
</html>
