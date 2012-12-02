<div id="rutinaInfo" class="accordion-body collapse">	
  	<g:if test="${rutinaInstance!=null}">
  		<div class="accordion-inner">	
			<h4>
				PRESCRIPCIÓN DE EJERCICIO 
				GRUPO ${rutinaInstance?.grupo}
			</h4>
			<h5>Características: ${rutinaInstance?.caracteristicas}</h5> 	
			<p><span style="font-family:comic sans ms,cursive;">
				<strong>Objetivo: &nbsp;</strong><em>${rutinaInstance?.objetivo}</em></span></p>
			<p>
			<p><span style="font-family:comic sans ms,cursive;">
				<strong>Periodo: &nbsp;</strong><em>${rutinaInstance?.periodo}</em></span></p>
			<p>
			<p><span style="font-family:comic sans ms,cursive;">
				<strong>Frecuencia por semana: &nbsp;</strong><em>${rutinaInstance?.frecuenciaSemanal}</em></span></p>
			<p>
			<p><span style="font-family:comic sans ms,cursive;">
				<strong>Duracion por sesion: &nbsp;</strong><em>${rutinaInstance?.duracionSesion}</em></span></p>
			<p>
			<p><span style="font-family:comic sans ms,cursive;">
				<strong>Porcentaje de Frecuencia Cardiaca maxima: &nbsp;</strong><em>${rutinaInstance?.porcentajeFrecuenciaMax}</em></span></p>
			<p>
			<p><span style="font-family:comic sans ms,cursive;">
				<strong>Metodo: &nbsp;</strong><em> ${rutinaInstance?.metodo}</em></span></p>
			<p>
	  	</div>
  	</g:if>
  	<g:if test="${rutinaInstance==null}">
  		<div class="accordion-inner">
  			<h5>No se encuentra ninguna rutina asignada</h5>
  		</div> 
  	</g:if>
  	
</div>	
