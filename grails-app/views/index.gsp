<%@ page import="tpicardio.Tip" %>
<%@ page import="tpicardio.Cursos" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap"/> 		
		<title>Cardio UN - Home</title>		
		<g:javascript src="bootstrap-carousel.js" />
		<g:javascript library='jquery' />
		
				
	</head>

	<body>
		<div class="row-fluid">			
				<div id="myCarousel" class="carousel slide">
					<div class = "carousel-inner">
						<div class="active item">
							<img style="width:1170px; height:450px;" src="${resource(dir:'images/cardio',file:'SAM_0833.JPG')}" />
							<div class="carousel-caption">
			                    <h4>Ubicación</h4>
			                    <p style="color: white;">Ubicado en el segundo piso del polideportivo, Universidad Nacional de Colombia</p>
		                    </div>
						</div>
						<div class="item">
							<img style="width:1170px; height:450px;" src="${resource(dir:'images/cardio',file:'SAM_0837.JPG')}">							
							<div class="carousel-caption">
			                    <h4>Instalaciones</h4>
			                    <p style="color: white;">Excelente ambiente en nuestras instalaciones </p>
		                    </div>
		                </div>
						<div class="item">
							<img style="width:1170px; height:450px;" src="${resource(dir:'images/cardio',file:'SAM_0810.JPG')}" />
							<div class="carousel-caption">
			                    <h4>Maquinaria</h4>
			                    <p style="color: white;">Podras encontrar diferentes tipos de máquinas</p>
		                    </div>
						</div>
						<div class="item">
							<img style="width:1170px; height:450px;" src="${resource(dir:'images/cardio',file:'SAM_0802.JPG')}" />
							<div class="carousel-caption">
			                    <h4>y mas...</h4>
			                    <p style="color: white;">...</p>
		                    </div>
						</div>
					</div>
					<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
					<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>						
				</div>
			<div class="row-fluid">					
				<div class="span4">
					<h2>Otros cursos libres</h2>
					<p>El área de actividad física y deporte, de la Universidad Nacional de Colombia, sede Bogotá.
					Tiene a la disposición de la comunidad los siguientes cursos libres.</p>
					<ul class="nav nav-list">
						<g:each in="${Cursos.list([sort:"nombre",order:"asc"])}" var="cursosInstance">						
							<p><g:link base="http://${cursosInstance?.url}">${cursosInstance?.nombre }</g:link></p>
						</g:each>	
						
					</ul>
				</div>

				<div class="span8">	
					<div class="page-header">				
						<h2>Objetivo</h2>
						<p > El objetivo del área de Actividad Física y Deporte del Sistema de Bienestar Universitario 
						en la Universidad Nacional de Colombia, es estimular la práctica de actividades de carácter recreativo, 
						formativo y competitivo, en el marco del desarrollo humano integral de la comunidad universitaria y la implementación y 
						consolidación del deporte universitario en el país en diferentes niveles de rendimiento.  </p>		
					</div>
					<div class="page-header">				
						<h2>Lineamientos</h2>	
						<ul class="unstyled">
							<li><p > El área de Actividad Física y Deporte tendrá los siguientes lineamientos:</p></li>	
							<ul>
								<li>Diseño de programas que respondan a los intereses de la comunidad universitaria.</li>
								<li> Promoción de hábitos de vida saludable y formación integral, a través del desarrollo de actividades físicas y deportivas.</li>
								<li>Oferta de programas, proyectos y escenarios para el desarrollo de actividades físicas y deportivas para la comunidad universitaria y el entorno social, una vez satisfecha la demanda interna.</li>
								<li>Liderazgo en el desarrollo del deporte universitario de alto rendimiento en el país.</li>
							</ul>
						</ul>	
					</div>				
					<div class="page-header">				
						<h2>Tips</h2>		
					</div>
					<g:each in="${Tip.list([sort:"id",max:3,order:"desc"])}" var="tipInstance">						
						<div class="span1">
							<img class="img-polaroid" style="width:35px; height:35px;" src="${createLink(controller:'imagen', action:'showImagenUser',params:[id:tipInstance.entrenador.id]) }" />
						</div>
						<div class="span10">
							<blockquote>
								<p>${tipInstance?.descripcion}</p>
								<small>${tipInstance?.entrenador.nombre},<cite title="Source Title"> Entrenador</cite></small>
							</blockquote>	
						</div>					
					</g:each>					
					<legend><g:link controller="tip" action="list"><p style="font-size:15px;">Ver mas ...</p></g:link></legend>	
				</div>
			</div>
		</div>		
	</body>
</html>
