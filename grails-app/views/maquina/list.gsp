
<%@ page import="tpicardio.Maquina" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'maquina.label', default: 'Maquina')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">Máquinas</li>	
							
							<div class="accordion" id="accordion">
								<g:each in="${listaMaquinaTipo}" var="listaMaquina">
									<div class="accordion-group">
										<div class="accordion-heading">
											<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#${listaMaquina.get(0).tipo}">${listaMaquina.get(0).tipo}</a>													
										</div>	
									</div>									
									<div id="${listaMaquina.get(0).tipo}" class="accordion-body collapse">	
									  	<div class="accordion-inner">	
									  		<g:each in="${listaMaquina}" var="maquina">									  			
												<li >
													<a href="?id=${maquina.id}" id="${maquina.id}" class="">${maquina}</a>
												</li>												
											</g:each>
									  	</div>
									</div>									
								</g:each>
							</div>	
								
						<sec:ifAllGranted roles="ROLE_COACH">
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>	
						</sec:ifAllGranted>			
					</ul>						
				</div>
				<div class="well">
					<p class="muted" >Capacidad del gimnasio por sesión: ${capacidad} usuarios</p>
				</div>
			</div>
			
			
			<div class="span9">	
				<g:if test="${flash.message}">
					<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<g:hasErrors bean="${maquinaInstance}">
					<bootstrap:alert class="alert-error">				
						<ul>
							<g:eachError bean="${maquinaInstance}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
					</bootstrap:alert>
				</g:hasErrors>		
				<div class="page-header">
					<h1>${entityName}</h1>
				</div>
				
				<g:if test="${maquinaInstanceList.isEmpty()}">
					<p class="muted">Lo sentimos, por el momento no se encuentra ninguna máquina registrada en el sistema.</p>
				</g:if>
				<g:if test="${ !maquinaInstanceList.isEmpty() && maquinaInstance==null}">
					<p class="muted">Seleccione una de las maquinas listadas a la izquierda de la página para ver su información correspondiente.</p>
				</g:if>
				<g:render template="/maquina/infoMaquina" />					
			</div>
		</div>
	</body>
</html>