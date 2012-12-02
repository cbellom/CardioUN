<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><g:layoutTitle default="Cardio UN"/></title>
		<meta name="description" content="">
		<meta name="author" content="">

		<link rel="shortcut icon" href="/TPIcardio/static/images/logo.jpg" />		
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>	

		<link rel="stylesheet" href="${resource(dir: 'css/smoothness', file: 'jquery-ui-1.9.1.custom.min.css')}" type="text/css"></link>

		<g:javascript src="bootstrap-modal.js" />
		<g:javascript src="bootstrap-collapse.js" />
		<g:javascript src="bootstrap-dropdown.js" />
		<meta name="viewport" content="initial-scale = 1.0">
		<r:require modules="scaffolding"/>
		
		<ckeditor:resources />
		<calendar:resources lang="es"/>
		<g:layoutHead/>		
		<r:layoutResources/>
	</head>

	<body>

		<nav class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">					
					<a class="brand" href="${createLink(uri: '/')}"><img style="height:19px;" src="${resource(dir:'images',file:'logo.JPG')}" />CardioUN </a>
					<div class="nav-collapse" style="height: auto;">
						<ul class="nav">							
							<li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a href="${createLink(uri: '/')}">Home</a></li>
							<li<%= controllerName == "maquina" ? ' class="active" ':''%>><a href="${createLink(controller:'maquina', action:'index')}">Gimnasio</a></li>
							<li<%= controllerName == "ejercicio" ? ' class="active" ':''%>><a href="${createLink(controller:'ejercicio', action:'index')}">Ejercicio</a></li>
							<li<%= controllerName == "contacto" ? ' class="active" ':''%>><a href="${createLink(controller:'contacto', action:'index')}">Contacto</a></li>
						</ul>				
						<sec:ifNotLoggedIn>							
						    <form class="navbar-form pull-right" action="${resource(file: 'j_spring_security_check')}" method='POST'>
								<input class = "span2" type="text" placeholder="nombre de usuario" name='j_username' id='username'>								
								<input class="span2" type="password" placeholder="contraseña" name='j_password' id='password'>
								<button class="btn btn-small" type="submit">Sign in</button>	
							</form>
						</sec:ifNotLoggedIn>
						<sec:ifLoggedIn>	
							<g:link controller="logout"  class="btn btn-small pull-right">Sign out</g:link>
							<sec:ifAllGranted roles="ROLE_USER">
								<g:link controller="usuario" action="perfilUsuario" class="btn btn-small pull-right">Mi perfil</g:link>	
							</sec:ifAllGranted>	
							<sec:ifAllGranted roles="ROLE_COACH">
								<g:link controller="entrenador" action="perfilEntrenador" class="btn btn-small pull-right">Mi perfil</g:link>	
							</sec:ifAllGranted>	
							<sec:ifAllGranted roles="ROLE_ADMIN">
								<g:link controller="administrador" action="perfilAdministrador" class="btn btn-small pull-right">Mi perfil</g:link>	
							</sec:ifAllGranted>	
						</sec:ifLoggedIn>
					</div>					
				</div>
			</div>
		</nav>
		<div class="container">
			<g:layoutBody/>
			<hr>
			<footer>
				<p>Universidad Nacional de Colombia, Sede Bogotá. Taller de Proyectos de Ingeniería 2012-II. <g:link base="https://github.com/cbellom/CardioUN.git">Desarrollo</g:link></p> 
			</footer>
		</div>
		<r:layoutResources/>

	</body>
</html>