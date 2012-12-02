
<%@ page import="tpicardio.PruebaValoracion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'pruebaValoracion.label', default: 'PruebaValoracion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span4">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<g:form class="form-search" action="buscarPorUsuarioFecha">	
							<sec:ifAllGranted roles="ROLE_COACH">
								<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cedula', 'error')} required"><p></p>
									<input  name="cedula" type="number"  placeholder="Cédula" value="${cedula}" required="" min="1000000" max="99999999999"/><p></p>
								</div>
							</sec:ifAllGranted>	
							<sec:ifAllGranted roles="ROLE_ADMIN">
								<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cedula', 'error')} required"><p></p>
									<input  name="cedula" type="number"  placeholder="Cédula" value="${cedula}" required="" min="1000000" max="99999999999"/><p></p>
								</div>
							</sec:ifAllGranted>	
							<div class="fieldcontain ${hasErrors(bean: pruebaValoracionInstance, field: 'fecha', 'error')} required">
								<calendar:datePicker name="fechaBusqueda" dateFormat="%Y-%m-%d" /><p></p>
							</div>
							<button type="submit" class="btn btn-inverse"><i class="icon-search icon-white"></i> Buscar</button>
						</g:form>
						<sec:ifAllGranted roles="ROLE_COACH">
							<li>
								<g:link class="create" action="create">
									<i class="icon-plus"></i>
									<g:message code="default.create.label" args="[entityName]" />
								</g:link>
							</li>
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_ADMIN">
							<li>
								<g:link class="create" action="create">
									<i class="icon-plus"></i>
									<g:message code="default.create.label" args="[entityName]" />
								</g:link>
							</li>
						</sec:ifAllGranted>
					</ul>
				</div>
			</div>
			
			<div class="span8">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
					<g:if test="${pruebaValoracionInstance?.grupo}">
						<dt><g:message code="pruebaValoracion.grupo.label" default="Grupo" /></dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="grupo"/></dd>						
					</g:if>
					<g:if test="${pruebaValoracionInstance?.fecha}">
						<dt><g:message code="pruebaValoracion.fecha.label" default="Fecha" /></dt>						
							<dd><g:formatDate date="${pruebaValoracionInstance?.fecha}" /></dd>						
					</g:if>			
					<g:if test="${pruebaValoracionInstance?.usuario}">
						<dt><g:message code="pruebaValoracion.usuario.label" default="Usuario" /></dt>						
							<dd><g:link controller="usuario" action="show" id="${pruebaValoracionInstance?.usuario?.id}">${pruebaValoracionInstance?.usuario?.encodeAsHTML()}</g:link></dd>						
					</g:if>									
					<g:if test="${pruebaValoracionInstance?.antecedentes}">
						<dt><g:message code="pruebaValoracion.antecedentes.label" default="Antecedentes" /></dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="antecedentes"/></dd>						
					</g:if>
					<g:if test="${pruebaValoracionInstance?.edad}">
						<dt><g:message code="pruebaValoracion.edad.label" default="Edad" /></dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="edad"/></dd>						
					</g:if>		
					<g:if test="${pruebaValoracionInstance?.talla}">
						<dt><g:message code="pruebaValoracion.talla.label" default="Talla" /> (m)</dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="talla"/></dd>						
					</g:if>													
					<g:if test="${pruebaValoracionInstance?.peso}">
						<dt><g:message code="pruebaValoracion.peso.label" default="Peso" /> (Kg)</dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="peso"/></dd>						
					</g:if>		
					<g:if test="${pruebaValoracionInstance?.imc}">
						<dt><g:message code="pruebaValoracion.imc.label" default="Imc" /></dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="imc"/></dd>						
					</g:if>						
					<g:if test="${pruebaValoracionInstance?.descripcionImc}">
						<dt><g:message code="pruebaValoracion.descripcionImc.label" default="Descripcion Imc" /></dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="descripcionImc"/></dd>						
					</g:if>				
					<g:if test="${pruebaValoracionInstance?.porcentajeGrasa}">
						<dt><g:message code="pruebaValoracion.porcentajeGrasa.label" default="Porcentaje Grasa" /> (%)</dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="porcentajeGrasa"/></dd>						
					</g:if>							
					<g:if test="${pruebaValoracionInstance?.descripcionPorcentajeGrasa}">
						<dt><g:message code="pruebaValoracion.descripcionPorcentajeGrasa.label" default="Descripcion Porcentaje Grasa" /></dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="descripcionPorcentajeGrasa"/></dd>						
					</g:if>		
					<g:if test="${pruebaValoracionInstance?.flexibilidad}">
						<dt><g:message code="pruebaValoracion.flexibilidad.label" default="Flexibilidad" /></dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="flexibilidad"/></dd>						
					</g:if>				
					<g:if test="${pruebaValoracionInstance?.descripcionFlexibilidad}">
						<dt><g:message code="pruebaValoracion.descripcionFlexibilidad.label" default="Descripcion Flexibilidad" /></dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="descripcionFlexibilidad"/></dd>						
					</g:if>				
					<g:if test="${pruebaValoracionInstance?.frecuenciaMax}">
						<dt><g:message code="pruebaValoracion.frecuenciaMax.label" default="Frecuencia Max" /></dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="frecuenciaMax"/></dd>						
					</g:if>				
					<g:if test="${pruebaValoracionInstance?.frecuenciaPrueba}">
						<dt><g:message code="pruebaValoracion.frecuenciaPrueba.label" default="Frecuencia Prueba" /></dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="frecuenciaPrueba"/></dd>						
					</g:if>				
					<g:if test="${pruebaValoracionInstance?.frecuenciaReposo}">
						<dt><g:message code="pruebaValoracion.frecuenciaReposo.label" default="Frecuencia Reposo" /></dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="frecuenciaReposo"/></dd>						
					</g:if>				
					<g:if test="${pruebaValoracionInstance?.latidos}">
						<dt><g:message code="pruebaValoracion.latidos.label" default="Latidos" /> durante 15 segundos</dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="latidos"/></dd>						
					</g:if>								
					<g:if test="${pruebaValoracionInstance?.vo2}">
						<dt><g:message code="pruebaValoracion.vo2.label" default="Vo2" /></dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="vo2"/></dd>						
					</g:if>		
					<g:if test="${pruebaValoracionInstance?.descripcionVo2}">
						<dt><g:message code="pruebaValoracion.descripcionVo2.label" default="Descripcion Vo2" /></dt>						
							<dd><g:fieldValue bean="${pruebaValoracionInstance}" field="descripcionVo2"/></dd>						
					</g:if>													
								
									
				</dl>	
				<g:if test="${pruebaValoracionInstance?.id}">			
					<sec:ifAllGranted roles="ROLE_COACH">
						<g:form>
							<g:hiddenField name="id" value="${pruebaValoracionInstance?.id}" />
							<div class="form-actions">
								<a class="btn" href="${createLink(controller:'pruebaValoracion', action:'estadistica', params:[cedula:pruebaValoracionInstance?.usuario.cedula])}">
									<i class="icon-eye-open"></i>
									<g:message code="default.button.estadistica.label" default="Ver Estadisticas" />
								</a>
								<g:link class="btn btn-inverse" action="edit" id="${pruebaValoracionInstance?.id}">
									<i class="icon-pencil icon-white"></i>
									<g:message code="default.button.edit.label" default="Edit" />
								</g:link>
								<button class="btn btn-danger" type="submit" name="_action_delete">
									<i class="icon-trash icon-white"></i>
									<g:message code="default.button.delete.label" default="Delete" />
								</button>
							</div>
						</g:form>
						
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_ADMIN">
						<g:form>
							<g:hiddenField name="id" value="${pruebaValoracionInstance?.id}" />							
							<div class="form-actions">
								<a class="btn" href="${createLink(controller:'pruebaValoracion', action:'estadistica', params:[cedula:pruebaValoracionInstance?.usuario.cedula])}">
									<i class="icon-eye-open"></i>
									<g:message code="default.button.estadistica.label" default="Ver Estadisticas" />
								</a>
								<g:link class="btn btn-inverse" action="edit" id="${pruebaValoracionInstance?.id}">
									<i class="icon-pencil icon-white"></i>
									<g:message code="default.button.edit.label" default="Edit" />
								</g:link>
								<button class="btn btn-danger" type="submit" name="_action_delete">
									<i class="icon-trash icon-white"></i>
									<g:message code="default.button.delete.label" default="Delete" />
								</button>
							</div>
						</g:form>
						</sec:ifAllGranted>
				</g:if>
			</div>

		</div>
	</body>
</html>
