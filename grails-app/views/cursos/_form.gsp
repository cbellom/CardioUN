<%@ page import="tpicardio.Cursos" %>


<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'nombre', 'error')} required">
		<label class="control-label" for="nombre">
			<g:message code="cursos.nombre.label" default="Nombre" />
		</label>
		<div class="controls">	
			<g:textField name="nombre" maxlength="20" required="" value="${cursosInstance?.nombre}"  />
		</div>					
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'url', 'error')} required">
		<label class="control-label" for="url">
			<g:message code="cursos.url.label" default="Url" />
			<span class="required-indicator">*</span>
		</label>
		<div class="controls">	
			<g:textField name="url" required="" value="${cursosInstance?.url}" placeholder="Ejemplo: wwww.pagina.com"/>
		</div>					
	</div>
</div>

