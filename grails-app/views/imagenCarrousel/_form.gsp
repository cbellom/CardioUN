<%@ page import="tpicardio.ImagenCarrousel" %>


<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: imagenCarrouselInstance, field: 'titulo', 'error')} ">
		<label class="control-label" for="descripcion">
			<g:message code="imagenCarrousel.titulo.label" default="Titulo" />
			
		</label>
		<div class="controls">	
			<g:textField name="titulo" value="${imagenCarrouselInstance?.titulo}"/>
		</div>					
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: imagenCarrouselInstance, field: 'descripcion', 'error')} ">
		<label class="control-label" for="descripcion">
			<g:message code="imagenCarrousel.descripcion.label" default="Descripcion" />
			
		</label>
		<div class="controls">	
			<g:textField name="descripcion" value="${imagenCarrouselInstance?.descripcion}"/>
		</div>					
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: imagenCarrouselInstance, field: 'imagen', 'error')} required">
		<label class="control-label" for="imagen">
			<g:message code="imagenCarrousel.imagen.label" default="Imagen" />
			<span class="required-indicator">*</span>
		</label>
		<div class="controls">	
			<input type="file" name="myFile" id="myFile"/><br></br>	
		</div>					
	</div>
</div>


