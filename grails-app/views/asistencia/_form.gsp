<%@ page import="tpicardio.Asistencia" %>



<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="asistencia.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${asistenciaInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="asistencia.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${tpicardio.Usuario.list()}" optionKey="id" required="" value="${asistenciaInstance?.usuario?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'percepcionEsfuerzo', 'error')} required">
	<label for="percepcionEsfuerzo">
		<g:message code="asistencia.percepcionEsfuerzo.label" default="Percepcion Esfuerzo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="percepcionEsfuerzo" from="${0..10}" required="" value="${fieldValue(bean: asistenciaInstance, field: 'percepcionEsfuerzo')}" valueMessagePrefix="asistenciaInstance.percepcionEsfuerzo" noSelection="['': '']"/>
</div>

