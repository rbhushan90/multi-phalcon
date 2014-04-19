<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Eduapps</title>

 <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" rel="stylesheet">
    {{ stylesheet_link('css/bootstrap.css') }}
    {{ stylesheet_link('css/bootstrap-responsive.css') }}
    {#{ stylesheet_link('css/yah.css') }#}
 	{{ stylesheet_link('css/admin.css') }}
 	
 {#	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js">
	</script>
 #}
 	{{javascript_include('js/jquery.min.js')}}
 	{{javascript_include('js/bootstrap.min.js')}}
 	</head>
	<body>

		{{ content() }}
<script type="text/javascript">
	   	$('ul.nav li.dropdown').hover(function() {
        $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(200);
        }, function() {
      	$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(200);
    	});
	</script>
	</body>
		

</html>