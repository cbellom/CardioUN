<%@ page import="tpicardio.Usuario" %>


<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
		<label class="control-label" for="username">
			<g:message code="usuario.username.label" default="Username" />
		</label>
		<div class="controls">	
			<g:textField name="username" maxlength="20" required="" value="${usuarioInstance?.username}"/>
		</div>					
	</div>
</div>	

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cedula', 'error')} required">
		<label class="control-label" for="cedula">
			<g:message code="usuario.cedula.label" default="Cedula" />
		</label>
		<div class="controls">	
			<g:field name="cedula" type="number" value="${usuarioInstance.cedula}" required="" min="1000000" max="99999999999"/>
		</div>
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
		<label class="control-label" for="nombre">
			<g:message code="usuario.nombre.label" default="Nombre" />
		</label>
		<div class="controls">	
			<g:textField name="nombre" maxlength="50" required="" value="${usuarioInstance?.nombre}"/>
		</div>
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellido', 'error')} required">
		<label class="control-label" for="apellido">
			<g:message code="usuario.apellido.label" default="Apellido" />
		</label>
		<div class="controls">
			<g:textField name="apellido" maxlength="50" required="" value="${usuarioInstance?.apellido}"/>
		</div>
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'correo', 'error')} required">
		<label class="control-label" for="correo">
			<g:message code="usuario.correo.label" default="Correo" />
		</label>
		<div class="controls">
			<g:field type="email" name="correo" required="" value="${usuarioInstance?.correo}"/>
		</div>
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'edad', 'error')} required">
		<label class="control-label" for="edad">
			<g:message code="usuario.edad.label" default="Edad" />
		</label>
		<div class="controls">
			<g:field name="edad" type="number" min="10" max="100" value="${usuarioInstance.edad}" required="" min="15" max="90"/>
		</div>
	</div>
</div>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'imagen', 'error')} ">
		<label  class="control-label" for="imagen">
			<g:message code="usuario.imagen.label" default="Imagen" />
		</label>
		<div class="controls">
			<g:select id="imagen" name="imagen.id" from="${listaImagenes}" optionKey="id" value="${usuarioInstance?.imagen?.id}" class="many-to-one" noSelection="['null': '']"/>
		</div>					
	</div>
</div>
<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean:  usuarioInstance, field: 'genero', 'error')} ">
		<label  class="control-label" for="genero">
			<g:message code="usuario.genero.label" default="Genero" />
			
		</label>
		<div class="controls">
			<g:select name="genero" from="${ usuarioInstance.constraints.genero.inList}" value="${ usuarioInstance?.genero}" valueMessagePrefix=" usuario.genero" noSelection="['': '']"/>
		</div>					
	</div>
</div>


