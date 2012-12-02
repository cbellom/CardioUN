<%@page import="tpicardio.Rutina"%>
<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}
            
			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
		

<center><h1>Hola ${usuario.nombre} esta es tu nueva Rutina</h1></center>
<center><p>Grupo: ${rutinaInstance.grupo}</p></center>
<center><p>Objetivo: ${rutinaInstance.objetivo}</p></center>
<center><p>Caracteristicas: ${rutinaInstance.caracteristicas}</p></center>
<center><p>Periodo: ${rutinaInstance.periodo}</p></center>
<center><p>Frecuencia Semanal: ${rutinaInstance.frecuenciaSemanal}</p></center>
<center><p>Duracion por sesión: ${rutinaInstance.duracionSesion}</p></center>
<center><p>Porcentaje de frecuencia maxima: ${rutinaInstance.porcentajeFrecuenciaMax}</p></center>

<center><h3>Metodo</h3></center>
<center><p>${rutinaInstance.metodo}</p></center>