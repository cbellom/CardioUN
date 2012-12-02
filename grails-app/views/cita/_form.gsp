<%@ page import="tpicardio.Cita" %>



<div class="fieldcontain ${hasErrors(bean: citaInstance, field: 'entrenador', 'error')} required">
	<label for="entrenador">
		<g:message code="cita.entrenador.label" default="Entrenador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entrenador" name="entrenador.id" from="${tpicardio.Entrenador.list()}" optionKey="id" required="" value="${citaInstance?.entrenador?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: citaInstance, field: 'fechaFinal', 'error')} required">
	<label for="fechaFinal">
		<g:message code="cita.fechaFinal.label" default="Fecha Final" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaFinal" precision="day"  value="${citaInstance?.fechaFinal}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: citaInstance, field: 'fechaInicial', 'error')} required">
	<label for="fechaInicial">
		<g:message code="cita.fechaInicial.label" default="Fecha Inicial" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaInicial" precision="day"  value="${citaInstance?.fechaInicial}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: citaInstance, field: 'usuarios', 'error')} ">
	<label for="usuarios">
		<g:message code="cita.usuarios.label" default="Usuarios" />
		
	</label>
	
</div>

