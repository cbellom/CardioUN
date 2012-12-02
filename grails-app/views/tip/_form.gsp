<%@ page import="tpicardio.Tip" %>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: tipInstance, field: 'nombre', 'error')}">
		<label class="control-label" for="nombre">
			<g:message code="tip.nombre.label" default="Nombre" />		
		</label>
		<div class="controls">
			<g:textField name="nombre" value="${tipInstance?.nombre}"/>
		</div>					
	</div>
</div>	

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: tipInstance, field: 'descripcion', 'error')} ">
		<label class="control-label" for="descripcion">
			<g:message code="tip.descripcion.label" default="Descripcion" />		
		</label>
		<div class="controls">
			<ckeditor:editor name="descripcion" toolbar="custom" >${tipInstance?.descripcion}</ckeditor:editor>
		</div>					
	</div>
</div>	

