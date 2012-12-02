
<%@ page import="tpicardio.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<%-- Import para graficas --%>	
		<link type="text/css" rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.jqplot.min.css')}"/>
		<link type="text/css" rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.jqplot.css')}" />	
		<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.jqplot.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js/jqplot', file: 'jqplot.highlighter.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js/jqplot', file: 'jqplot.dateAxisRenderer.min.js')}"></script>
		<%-- Import para graficas --%> 
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span4">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<g:form class="form-search" action="buscarPorCedula">
							<div class="input-append">	
								<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cedula', 'error')} required">
									<input class="input-medium search-query" name="cedula" type="number"  placeholder="Cédula" value="${cedula}" required=""/>									
									<button type="submit" class="btn"><i class="icon-search"></i> Buscar</button>	
								</div>															
							</div>
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
					<g:if test="${usuarioInstance?.cedula}">
						<dt><g:message code="usuario.cedula.label" default="Cedula" /></dt>						
							<dd><g:fieldValue bean="${usuarioInstance}" field="cedula"/></dd>					
					</g:if>
					<g:if test="${usuarioInstance?.nombre}">
						<dt><g:message code="usuario.nombre.label" default="Nombre" /></dt>						
							<dd><g:fieldValue bean="${usuarioInstance}" field="nombre"/></dd>					
					</g:if>				
					<g:if test="${usuarioInstance?.apellido}">
						<dt><g:message code="usuario.apellido.label" default="Apellido" /></dt>						
							<dd><g:fieldValue bean="${usuarioInstance}" field="apellido"/></dd>						
					</g:if>				
					<g:if test="${usuarioInstance?.correo}">
						<dt><g:message code="usuario.correo.label" default="Correo" /></dt>						
							<dd><g:fieldValue bean="${usuarioInstance}" field="correo"/></dd>						
					</g:if>					
					<g:if test="${usuarioInstance?.edad}">
						<dt><g:message code="usuario.edad.label" default="Edad" /></dt>						
							<dd><g:fieldValue bean="${usuarioInstance}" field="edad"/></dd>						
					</g:if>				
					<g:if test="${usuarioInstance?.peso}">
						<dt><g:message code="usuario.peso.label" default="Peso" /></dt>						
							<dd><g:fieldValue bean="${usuarioInstance}" field="peso"/></dd>						
					</g:if>				
					<g:if test="${usuarioInstance?.altura}">
						<dt><g:message code="usuario.altura.label" default="Altura" /></dt>						
							<dd><g:fieldValue bean="${usuarioInstance}" field="altura"/></dd>						
					</g:if>				
					<g:if test="${usuarioInstance?.imc}">
						<dt><g:message code="usuario.imc.label" default="Imc" /></dt>						
							<dd><g:fieldValue bean="${usuarioInstance}" field="imc"/></dd>						
					</g:if>					
					<g:if test="${usuarioInstance?.genero}">
						<dt><g:message code="usuario.imc.genero" default="Genero" /></dt>						
							<dd><g:fieldValue bean="${usuarioInstance}" field="genero"/></dd>						
					</g:if>				
					<g:if test="${usuarioInstance?.citas}">
						<dt><g:message code="usuario.citas.label" default="Citas" /></dt>						
						<g:each in="${usuarioInstance.citas}" var="c">
							<dd><g:link controller="cita" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></dd>
						</g:each>						
					</g:if>				
				</dl>
				<div id="chart1" ></div>
				<div id="chart2" ></div>
				<script type='text/javascript'>
					$(document).ready(function(){
						var percepcionPoints = [];	
						<g:each in="${percepcionInstanceList}" var="percepcion">		
							percepcionPoints.push(['${percepcion.fecha}',${percepcion.percepcionEsfuerzo}]);		
						</g:each>

						var asistenciaPoints = [];	
						<g:each in="${asistenciaInstanceList}" var="asistencia">		
							asistenciaPoints.push(['${asistencia.fecha}',${asistencia.percepcionEsfuerzo}]);		
						</g:each>
						
  						var plot1 = $.jqplot('chart1', [asistenciaPoints], {
						      title:'Asistencia',
						      axes:{
						        xaxis:{
						          renderer:$.jqplot.DateAxisRenderer
						          ,
						          tickOptions:{
						            formatString:'%b&nbsp;%#d'
						          } 
						        },
						        yaxis:{
						          tickOptions:{
						            formatString:''
						            }
						        }
						      },
						      highlighter: {
						        show: true,
						      },
						      cursor: {
						        show: false
						      }
						  });
  						var plot2 = $.jqplot('chart2', [percepcionPoints], {
						      title:'Percepcion de esfuerzo por sesión',
						      axes:{
						        xaxis:{
						          renderer:$.jqplot.DateAxisRenderer
						          ,
						          tickOptions:{
						            formatString:'%b&nbsp;%#d'
						          } 
						        },
						        yaxis:{
						          tickOptions:{
						            formatString:''
						            }
						        }
						      },
						      highlighter: {
						        show: true,
						      },
						      cursor: {
						        show: false
						      }
						  });
						});
					</script>	
					
				
					<g:if test="${usuarioInstance?.cedula}">
					<g:form>
						<g:hiddenField name="id" value="${usuarioInstance?.id}" />
						<div class="form-actions">
							<g:link class="btn btn-inverse" action="edit" id="${usuarioInstance?.id}">
								<i class="icon-pencil icon-white"></i>
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
							<button class="btn btn-danger" type="submit" name="_action_delete">
								<i class="icon-trash icon-white"></i>
								<g:message code="default.button.delete.label" default="Delete" />
							</button>
						</div>
					</g:form>
					</g:if>
			</div>
		</div>
	</body>
</html>
