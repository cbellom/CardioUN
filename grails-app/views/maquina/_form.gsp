<%@ page import="tpicardio.Maquina" %>


<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'estado', 'error')} ">
		<label  class="control-label" for="estado">
			<g:message code="maquina.estado.label" default="Estado" />		
		</label>
		<div class="controls">	
			<g:select name="estado" from="${maquinaInstance.constraints.estado.inList}" value="${maquinaInstance?.estado}" valueMessagePrefix="maquina.estado" noSelection="['': '']"/>
		</div>					
	</div>
</div>
<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'marca', 'error')} ">
		<label  class="control-label" for="marca">
			<g:message code="maquina.marca.label" default="Marca" />
			
		</label>
		<div class="controls">
			<g:textField name="marca" value="${maquinaInstance?.marca}"/>
		</div>					
	</div>
</div>
<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'modelo', 'error')} ">
		<label  class="control-label" for="modelo">
			<g:message code="maquina.modelo.label" default="Modelo" />
			
		</label>
		<div class="controls">
			<g:textField name="modelo" value="${maquinaInstance?.modelo}"/>
		</div>					
	</div>
</div>
<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'numero', 'error')} required">
		<label  class="control-label" for="numero">
			<g:message code="maquina.numero.label" default="Numero" />
		</label>
		<div class="controls">
			<g:field name="numero" type="number" value="${maquinaInstance.numero}" required=""/>
		</div>					
	</div>
</div>
<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'observacion', 'error')} ">
		<label  class="control-label" for="observacion">
			<g:message code="maquina.observacion.label" default="Observacion" />
			
		</label>
		<div class="controls">
			<g:textField name="observacion" value="${maquinaInstance?.observacion}"/>
		</div>					
	</div>
</div>
<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'placaReferencia', 'error')} required">
		<label  class="control-label" for="placaReferencia">
			<g:message code="maquina.placaReferencia.label" default="Placa Referencia" />
		</label>
		<div class="controls">
			<g:field name="placaReferencia" type="number" value="${maquinaInstance.placaReferencia}" required=""/>
		</div>					
	</div>
</div>
<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'tipo', 'error')} ">
		<label  class="control-label" for="tipo">
			<g:message code="maquina.tipo.label" default="Tipo" />
			
		</label>
		<div class="controls">
			<g:select name="tipo" from="${maquinaInstance.constraints.tipo.inList}" value="${maquinaInstance?.tipo}" valueMessagePrefix="maquina.tipo" noSelection="['': '']"/>
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
