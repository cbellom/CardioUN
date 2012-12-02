<%@ page import="tpicardio.Rutina" %>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cedula', 'error')} required">
		<label class="control-label" for="cedula">
			<g:message code="usuario.cedula.label" default="Cedula" />
		</label>
		<div class="controls">	
			<g:field name="cedula" type="number" value="${cedula}" required="" min="1000000" max="99999999999"/>
		</div>
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: rutinaInstance, field: 'grupo', 'error')} required">
		<label class="control-label"for="grupo">
			<g:message code="rutina.grupo.label" default="Grupo" />
		</label>
		<div class="controls">
			<g:textField name="grupo" required="" value="${rutinaInstance?.grupo}"/>
		</div>
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: rutinaInstance, field: 'objetivo', 'error')} required">
		<label class="control-label"for="objetivo">
			<g:message code="rutina.objetivo.label" default="Objetivo" />
		</label>
		<div class="controls">
			<g:textField name="objetivo" required="" value="${rutinaInstance?.objetivo}"/>
		</div>
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: rutinaInstance, field: 'caracteristicas', 'error')} required">
		<label class="control-label" for="caracteristicas">
			<g:message code="rutina.caracteristicas.label" default="Caracteristicas" />
		</label>
		<div class="controls">
			<g:textField name="caracteristicas" required="" value="${rutinaInstance?.caracteristicas}"/>
		</div>
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: rutinaInstance, field: 'periodo', 'error')} required">
		<label class="control-label"for="periodo">
			<g:message code="rutina.periodo.label" default="Periodo" />
		</label>
		<div class="controls">
			<g:textField name="periodo" required="" value="${rutinaInstance?.periodo}"/>
		</div>
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: rutinaInstance, field: 'frecuenciaSemanal', 'error')} required">
		<label class="control-label"for="frecuenciaSemanal">
			<g:message code="rutina.frecuenciaSemanal.label" default="Frecuencia Semanal" />
		</label>
		<div class="controls">
			<g:textField name="frecuenciaSemanal" required="" value="${rutinaInstance?.frecuenciaSemanal}"/>
		</div>
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: rutinaInstance, field: 'duracionSesion', 'error')} required">
		<label class="control-label"for="duracionSesion">
			<g:message code="rutina.duracionSesion.label" default="Duracion Sesion" />
		</label>
		<div class="controls">
			<g:textField name="duracionSesion" required="" value="${rutinaInstance?.duracionSesion}"/>
		</div>
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: rutinaInstance, field: 'porcentajeFrecuenciaMax', 'error')} required">
		<label class="control-label"for="porcentajeFrecuenciaMax">
			<g:message code="rutina.porcentajeFrecuenciaMax.label" default="Porcentaje Frecuencia Max" />
		</label>
		<div class="controls">
		<g:textField name="porcentajeFrecuenciaMax" required="" value="${rutinaInstance?.porcentajeFrecuenciaMax}"/>
		</div>
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: rutinaInstance, field: 'metodo', 'error')} required">
		<label class="control-label"for="metodo">
			<g:message code="rutina.metodo.label" default="Metodo" />
		</label>
		<div class="controls">
			<ckeditor:editor name="metodo" toolbar="custom" >${rutinaInstance?.metodo}</ckeditor:editor>
		</div>
	</div>
</div>

