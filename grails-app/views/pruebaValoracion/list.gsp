
<%@ page import="tpicardio.PruebaValoracion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'pruebaValoracion.label', default: 'PruebaValoracion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		
		<%-- Import para graficas --%>
		
		
		
		<link type="text/css" rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.jqplot.min.css')}"/>
		<link type="text/css" rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.jqplot.css')}" />
		
<%--		<link rel="stylesheet" href="../css/jquery.jqplot.min.css" type="text/css">--%>
<%--		<link rel="stylesheet" href="../css/jquery.jqplot.css" type="text/css">--%>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.jqplot.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js/jqplot', file: 'jqplot.highlighter.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js/jqplot', file: 'jqplot.dateAxisRenderer.min.js')}"></script>
<%--		
		<script type="text/javascript" src="${resource(dir: 'js/jqplot', file: 'jqplot.cursor.min.js')}"></script>

		<script type="text/javascript" src="${resource(dir: 'js/jqplot', file: 'jqplot.highlighter.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js/jqplot', file: 'jqplot.dateAxisRenderer.min.js')}"></script>
--%>
<%-- Import para graficas --%> 
		
		
		
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">
				<script type='text/javascript'>
					$(document).ready(function(){
						  var line1=[
								<g:each in="${pruebaValoracionInstanceList}" var="prueba">
								['${prueba.fecha}',${prueba.peso}],
								</g:each>
				<%--				['2008-09-30 4:00PM',4], ['2008-10-30 4:00PM',6.5], ['2008-11-30 4:00PM',5.7], ['2008-12-30 4:00PM',9], ['2009-01-30 4:00PM',8.2]--%>
							      ];
						  var plot1 = $.jqplot('chart1', [line1], {
						      title:'usuario X',
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
				<%--		        sizeAdjust: 7.5--%>
						      },
						      cursor: {
						        show: false
						      }
						  });
						});
				</script>				
				<div class="span9">
					<div class="page-header">
						<h1>Estadisticas</h1>
					</div>
					<div id="chart1" style="height: 300px; width: 500px;"></div>
				</div>	
				<script type="text/javascript">
				<!--
					$(document).ready(function(){
						  // Some simple loops to build up data arrays.
						  var pesoPoints = [];	  
						  <g:each in="${pruebaValoracionInstanceList}" var="prueba">		
								pesoPoints.push(['${prueba.fecha}',${prueba.peso}]);		
						 </g:each>
						    
						  var imcPoints = []; 
						  <g:each in="${pruebaValoracionInstanceList}" var="prueba">		
						       imcPoints.push(['${prueba.fecha}',${prueba.imc}]);
						  </g:each>
						  
						  var flexibilidadPoints = []; 
						  <g:each in="${pruebaValoracionInstanceList}" var="prueba">
							    flexibilidadPoints.push(['${prueba.fecha}',${prueba.flexibilidad}]); 
							    </g:each>
						    
						  var grasaPoints = []; 
						  <g:each in="${pruebaValoracionInstanceList}" var="prueba">
							    grasaPoints.push(['${prueba.fecha}',${prueba.porcentajeGrasa}]); 
							    </g:each>
					
						  var vo2Points = []; 
						  <g:each in="${pruebaValoracionInstanceList}" var="prueba">
							    vo2Points.push(['${prueba.fecha}',${prueba.vo2}]); 
							    </g:each>
					
						 
						  var plot3 = $.jqplot('chart3', [pesoPoints, imcPoints, flexibilidadPoints, grasaPoints, vo2Points],
								{
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
								            formatString:'peso %d'
								            }
								        }
								      },
						      title:'Line Style Options', 
						      // Series options are specified as an array of objects, one object
						      // for each series.
						      highlighter: {
							        show: true,
					<%--		        sizeAdjust: 7.5--%>
							      },
						      series:[ 
						          {
						            // Change our line width and use a diamond shaped marker.
						            lineWidth:2, 
						            markerOptions: { style:'dimaond' }
						          }, 
						          {
						            // Don't show a line, just show markers.
						            // Make the markers 7 pixels with an 'x' style
						            showLine:false, 
						            markerOptions: { size: 7, style:"x" }
						          },
						          { 
						            // Use (open) circlular markers.
						            markerOptions: { style:"circle" }
						          }, 
						          { 
						            // Use (open) circlular markers.
						            markerOptions: { style:"circle" }
						          }, 
						          {
						            // Use a thicker, 5 pixel line and 10 pixel
						            // filled square markers.
						            lineWidth:5, 
						            markerOptions: { style:"filledSquare", size:10 }
						          }
						      ]
						    }
						  );
					    
					});
				//-->
				</script>
				
				<div class="span9">
					<div class="page-header">
						<h1>Estadisticas 2</h1>
					</div>
					<div id="chart3" style="height: 300px; width: 500px;"></div>
				</div>
				
				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				
				<g:form>
					<g:hiddenField name="id" value="${pruebaValoracionInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${pruebaValoracionInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>
			
		</div>
	</body>
</html>



