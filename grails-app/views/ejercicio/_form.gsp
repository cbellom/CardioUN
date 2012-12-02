<%@ page import="tpicardio.Ejercicio" %>

	<div class="control-group ">
		<div class="fieldcontain ${hasErrors(bean: ejercicioInstance, field: 'nombre', 'error')} ">
			<label class="control-label" for="nombre">
				<g:message code="ejercicio.nombre.label" default="Nombre" />
				
			</label>
			<div class="controls">
				<g:textField name="nombre" value="${ejercicioInstance?.nombre}"/>
			</div>					
		</div>
	</div>	
	
	<div class="control-group ">
		<div class="fieldcontain ${hasErrors(bean: ejercicioInstance, field: 'entrenador', 'error')} required">
			<label class="control-label" for="entrenador">
				<g:message code="ejercicio.entrenador.label" default="Entrenador" />
			</label>
			<div class="controls">
				<g:select id="entrenador" name="entrenador.id" from="${tpicardio.Entrenador.list()}" optionKey="id" required="" value="${ejercicioInstance?.entrenador?.id}" class="many-to-one"/>
			</div>					
		</div>
	</div>	

	<div class="control-group ">
		<div class="fieldcontain ${hasErrors(bean: ejercicioInstance, field: 'descripcion', 'error')} ">
			<label class="control-label" for="descripcion">
				<g:message code="ejercicio.descripcion.label" default="Descripcion" />		
			</label>
			<div class="controls">
				<ckeditor:editor name="descripcion" toolbar="custom" >${ejercicioInstance?.descripcion}</ckeditor:editor>
			</div>					
		</div>
	</div>		

	<div class="control-group ">
		<div class="fieldcontain ${hasErrors(bean: ejercicioInstance, field: 'imagen', 'error')} ">
			<label class="control-label" for="imagen">
				<g:message code="ejercicio.imagen.label" default="Imagen" />			
			</label>
			<div class="controls">
				<input type="file" name="myFile" id="myFile"/><br></br>	
			</div>					
		</div>
	</div>	