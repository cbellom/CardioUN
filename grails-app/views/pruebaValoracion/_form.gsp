<%@ page import="tpicardio.PruebaValoracion" %>

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
	<div class="fieldcontain ${hasErrors(bean: pruebaValoracionInstance, field: 'edad', 'error')} required">
		<label class="control-label" for="edad">
			<g:message code="pruebaValoracion.edad.label" default="Edad" />
		</label>
		<div class="controls">
			<g:field name="edad" type="number" value="${pruebaValoracionInstance.edad}" required="" min="15" max="90"/>
		</div>
	</div>					
</div>
<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: pruebaValoracionInstance, field: 'talla', 'error')} required">
		<label class="control-label" for="talla">
			<g:message code="pruebaValoracion.talla.label" default="Talla" /> (m)
		</label>
		<div class="controls">
			<g:field name="talla" type="number" step="0.01" value="${fieldValue(bean: pruebaValoracionInstance, field: 'talla')}" required="" min="1.0" max="2.8"/>
		</div>
	</div>					
</div>
<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: pruebaValoracionInstance, field: 'peso', 'error')} required">
		<label class="control-label" for="peso">
			<g:message code="pruebaValoracion.peso.label" default="Peso" /> (Kg)
		</label>
		<div class="controls">
			<g:field name="peso" type="number" step="0.1" value="${fieldValue(bean: pruebaValoracionInstance, field: 'peso')}" required="" min="40" max="200"/>
		</div>
	</div>					
</div>
<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: pruebaValoracionInstance, field: 'porcentajeGrasa', 'error')} required">
		<label class="control-label" for="porcentajeGrasa">
			<g:message code="pruebaValoracion.porcentajeGrasa.label" default="Porcentaje Grasa" /> (%)
		</label>
		<div class="controls">
			<g:field name="porcentajeGrasa" type="number" value="${fieldValue(bean: pruebaValoracionInstance, field: 'porcentajeGrasa')}" required="" min="0" max="100"/>
		</div>
	</div>					
</div>
<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: pruebaValoracionInstance, field: 'flexibilidad', 'error')} required">
		<label class="control-label" for="flexibilidad">
			<g:message code="pruebaValoracion.flexibilidad.label" default="Flexibilidad" />
		</label>
		<div class="controls">
			<g:field name="flexibilidad" type="number" step="0.1" value="${fieldValue(bean: pruebaValoracionInstance, field: 'flexibilidad')}" required="" min="0" max="60"/>
		</div>
	</div>					
</div>
<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: pruebaValoracionInstance, field: 'frecuenciaReposo', 'error')} required">
		<label class="control-label" for="frecuenciaReposo">
			<g:message code="pruebaValoracion.frecuenciaReposo.label" default="Frecuencia Reposo" /> 
		</label>
		<div class="controls">
			<g:field name="frecuenciaReposo" type="number" value="${pruebaValoracionInstance.frecuenciaReposo}" required="" min="0" max="200"/>
		</div>
	</div>					
</div>
<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: pruebaValoracionInstance, field: 'latidos', 'error')} required">
		<label class="control-label" for="latidos">
			<g:message code="pruebaValoracion.latidos.label" default="Latidos" /> en 15 segundos
		</label>
		<div class="controls">
			<g:field name="latidos" type="number" value="${pruebaValoracionInstance.latidos}" required="" min="0" max="100"/>
		</div>
	</div>					
</div>
<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: pruebaValoracionInstance, field: 'antecedentes', 'error')} ">
		<label class="control-label" for="antecedentes">
			<g:message code="pruebaValoracion.antecedentes.label" default="Antecedentes" />		
		</label>
		<div class="controls">
			<g:textField name="antecedentes" value="${pruebaValoracionInstance?.antecedentes}"/>
		</div>
	</div>					
</div>