
<%@ page import="tpicardio.PruebaValoracion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'pruebaValoracion.label', default: 'PruebaValoracion')}" />
		<title>Estadisticas</title>		
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
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>	
						<sec:ifAllGranted roles="ROLE_COACH">		
							<p class="muted"> Busca las estadisticas de un usuario por medio de la cedula </p>			
							<g:form class="form-search" action="estadistica">	
									<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cedula', 'error')} required"><p></p>
										<input  name="cedula" type="number"  placeholder="Cédula" value="${cedula}" min="1000000" max="99999999999"/><p></p>
									</div>				
								<button type="submit" class="btn btn-inverse"><i class="icon-search icon-white"></i> Buscar</button>
							</g:form>
						</sec:ifAllGranted>		
					</ul>
				</div>
			</div>
			<div class="span9">
				<div class="page-header">
					<h1>Estadisticas </h1>
					<h5>Usuario: ${usuarioInstance?.username}</h5>
					<h5>Nombre: ${usuarioInstance?.nombre} ${usuarioInstance?.apellido} </h5>
					<h5>Cédula: ${usuarioInstance?.cedula}</h5>
				</div>
				
				<g:if test="${flash.message}">
					<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<div  id="chart1" ></div>
				<div id="chart2" ></div>
				<div id="chart3"></div>
				<div id="chart4" ></div>
				<div id="chart5" ></div>
				
				<script type='text/javascript'>
					$(document).ready(function(){
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
  						var plot1 = $.jqplot('chart1', [pesoPoints], {
						      title:'Peso vs Tiempo ',
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
						            formatString:'%d Kg'
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

						  var plot2 = $.jqplot('chart2', [imcPoints], {
						      title:'Imc vs Tiempo ',
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
						            formatString:'%d kg/m²'
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
						  var plot3 = $.jqplot('chart3', [flexibilidadPoints], {
						      title:'Flexibilidad vs Tiempo ',
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
						  var plot4 = $.jqplot('chart4', [grasaPoints], {
						      title:'Porcentaje de Grasa vs Tiempo ',
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
						            formatString:'%d %'
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
						  var plot5 = $.jqplot('chart5', [vo2Points], {
						      title:'Vo2 vs Tiempo ',
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
						            formatString:'%d ml/Kg/min'
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
			</div>
		</div>
	</body>
</html>



