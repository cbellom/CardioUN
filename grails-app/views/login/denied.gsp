<head>
	<meta name="layout" content="bootstrap"/> 
	<title><g:message code="springSecurity.denied.title" /></title>
	<script type="text/javascript">
		$(".alert").alert()
	</script>
</head>

<body>
<div class='body'>	
	<div class="alert alert-block alert-error fade in">
   <button type="button" class="close" data-dismiss="alert">×</button>
   <h4 class="alert-heading">Error!</h4>
   <p><div class='errors'>Lo sentimos no está autorizado para ver el contenido de esta página</div></p>
   <p>
     <a class="btn btn-danger" href="${createLink(uri: '/')}">Volver a la página principal</a><a class="btn" onclick="history.back()">Atras</a>
   </p>
 </div>
</div>
</body>

