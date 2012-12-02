
<%@ page import="tpicardio.Cita" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<title>Horario de citas</title>
		
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.weekcalendar.css')}" type="text/css"></link>
		<script type='text/javascript' src="${resource(dir: 'js', file: 'jquery.weekcalendar.js')}"></script>
	</head>
	<body>	
		<div class="page-header">
			<h1>Horario Citas</h1>
		</div>
		
		<g:if test="${flash.message}">
			<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
		</g:if>

  <style>
  
  p.description {
    font-size: 0.8em;
    padding: 1em;
    position: absolute;
    top: 3.2em;
    margin-right: 400px;
  }
  
  #message {
    font-size: 0.7em;
    position: absolute;
    top: 3em;
    right: 1em;
    width: 350px;
    display: none;
    padding: 1em;
    background: #ffc;
    border: 1px solid #dda;
  }
  </style>
		<script type='text/javascript'>
			$(document).ready(function() {
				var eventData = {
					    events : [
					    	  <g:each in="${citaInstanceList}" var="cita">
								{
									title:'${cita.titulo}<br></br> ${cita.usuarios}',
									start: new Date('${cita.start}'),
									end : new Date('${cita.end}'),
									id: ${cita.id}
								},
							</g:each>
					    ]
					  };
				
				$('#calendar').weekCalendar({
				      timeslotsPerHour: 6,
				      timeslotHeigh: 30,
				      hourLine: true,
				      data: eventData,
				      height: function($calendar) {
				        return $(window).height() - $('h1').outerHeight(true);
				      },
				      eventRender : function(calEvent, $event) {
				        if (calEvent.end.getTime() < new Date().getTime()) {
				          $event.css('backgroundColor', '#aaa');
				          $event.find('.time').css({'backgroundColor': '#999', 'border':'1px solid #888'});
				        }
				      },
				      <sec:ifAllGranted roles="ROLE_COACH">
				      eventNew: function(calEvent, $event) {
					      if (calEvent.end.getTime() >= new Date().getTime()) {
						      var cita = confirm('¿Desea crear una cita en este horario?');
							  if (cita) {
									start = calEvent.start;
									end = calEvent.end;
									$("#fechaInicial").val(start.getFullYear()+"-"+(start.getMonth()+1)+"-"+start.getDate()+" "+start.getHours()+":00")
									$("#fechaFinal").val(start.getFullYear()+"-"+(start.getMonth()+1)+"-"+start.getDate()+" "+(start.getHours()+1)+":00")
									$("#agregar").submit();
							  }else{
									$("#calendar").weekCalendar("removeEvent", calEvent.id);
							  }
					      }else {$("#calendar").weekCalendar("removeEvent", calEvent.id);}
				      },
				      eventDrop: function(calEvent, $event) {
				        //displayMessage('<strong>Moved Event</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
				      },
				      </sec:ifAllGranted>

				      <sec:ifAllGranted roles="ROLE_USER">
				      eventNew: function(calEvent, $event) {				        
							$("#calendar").weekCalendar("removeEvent", calEvent.id);
				      },
				      </sec:ifAllGranted>

				      <sec:ifNotLoggedIn>
				      eventNew: function(calEvent, $event) {
					        var cita = false;
							if (cita) {
								start = calEvent.start;
								end = calEvent.end;
								$("#fechaInicial").val(start.getFullYear()+"-"+(start.getMonth()+1)+"-"+start.getDate()+" "+start.getHours()+":"+start.getMinutes())
								$("#fechaFinal").val(end.getFullYear()+"-"+(end.getMonth()+1)+"-"+end.getDate()+" "+end.getHours()+":"+end.getMinutes())
								$("#agregar").submit();
							}else{
								$("#calendar").weekCalendar("removeEvent", calEvent.id);
							}
					      },				      
				      </sec:ifNotLoggedIn>

				      <sec:ifAllGranted roles="ROLE_ADMIN">
				      eventNew: function(calEvent, $event) {				        
							$("#calendar").weekCalendar("removeEvent", calEvent.id);
				      },
				      eventClick: function(calEvent, $event) {				        
				    	  var cita = confirm('¿Desea ver la informacion de esta cita?'); 
	                        if (cita) {     
	                            window.location.assign("./show/"+calEvent.id) 
	                        }
				      },
				      </sec:ifAllGranted>
				      
				      <sec:ifAllGranted roles="ROLE_USER">
				      eventClick: function(calEvent, $event) {
					      if (calEvent.end.getTime() >= new Date().getTime()) {
					    	  var cita = confirm('¿Desea separar horario para asistir a clase?');
							  if (cita) {	
								  $("#id").val(calEvent.id)
								  $("#separar").submit();
							  }
				    	  }else{}
				      },
				      </sec:ifAllGranted>
				      <sec:ifAllGranted roles="ROLE_COACH"> 
                      eventClick: function(calEvent, $event) { 
                        var cita = confirm('¿Desea ver la informacion de esta cita?'); 
                        if (cita) {     
                            window.location.assign("./show/"+calEvent.id) 
                        } 
                      }, 
                      </sec:ifAllGranted>
				      
				      draggable: function(calEvent, element) {
				          return false;
				      },

				      resizable: function(calEvent, element) {
				          return false;
				      }, 

				    });

				    function displayMessage(message) {
				      $('#message').html(message).fadeIn();
				    }

				    $('<div id="message" class="ui-corner-all"></div>').prependTo($('body'));

			});
	
		</script>
		
		<div id="calendar"></div>
		<form action="agregar" id="agregar" method="post"><input type="hidden" name="fechaInicial" id="fechaInicial" /><input  type="hidden" name="fechaFinal" id="fechaFinal" /></form>	
		<form action="separar" id="separar" method="post"><input type="hidden" name="id" id="id" /></form>
		${mensaje}
	
	
	</body>
</html>