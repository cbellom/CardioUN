
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<title>Contacto</title>
	</head>
	<body>
		<div class="row-fluid">			
			<div class="span4">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">Contacto</li>
						<p class="muted">	
							<br>Nosotros ofrecemos servicios orientados a mejorar tu calidad 
							de vida, salud, bienestar y desempeño deportivo. Proporcionando 
							soluciones integrales para que te veas, te sientas y te desempeñes 
							cada día mejor..</br>
							<br>Nos encontramos en la Universidad Nacional de Colombia - Sede Bogotá
							cerca de la facultad de enfermería, te esperamos.	</br>
							<br>En esta sección podrás ponerte en contacto con nosotros, envía un correo 
							con tus datos y tus inquietudes.</br>
							<br><img class="img-polaroid" style="width:190px; height:190px;" src="${resource(dir:'images',file:'mapaGym.png')}" /></br>
						</p>
					</ul>
				</div>
			</div>
			
			<div class="span8">
				<div class="page-header">
					<h1>Contactenos</h1>
				</div>				
				<div>
					<form class="form-horizontal" action="enviar" id="">
						<div class="fieldcontain required">
							<label>Nombre</label>
							<g:textField name="nombre" maxlength="50" required="" value=""/>
						</div>
						<div class="fieldcontain required">
							<label>Correo Electronico</label>
							<g:textField name="correo" maxlength="50" required="" value=""/>
						</div>
						<div class="fieldcontain required">
							<label>Asunto</label>
							<g:textField name="asunto" maxlength="50" required="" value=""/>
						</div>	
						<div class="fieldcontain">
							<ckeditor:editor name="contenido" toolbar="custom" ></ckeditor:editor>
						</div>
						<button type="submit" class="btn btn-inverse">
							<i class="icon-ok icon-white"></i>
							Enviar
						</button>
					
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
