<%@ page import="tpicardio.Administrador" %>
	
	<div class="control-group ">
		<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'username', 'error')} required">
			<label class="control-label" for="username">
				<g:message code="administrador.username.label" default="Username" />
			</label>
			<div class="controls">	
				<g:textField name="username" maxlength="20" required="" value="${administradorInstance?.username}"/>
			</div>					
		</div>
	</div>
	<div class="control-group ">
		<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'cedula', 'error')} required">
			<label  class="control-label" for="cedula">
				<g:message code="administrador.cedula.label" default="Cedula" />
			</label>
			<div class="controls">
				<g:field name="cedula" type="number" value="${administradorInstance.cedula}" required="" min="1000000" max="99999999999"/>
			</div>
		</div>
	</div>
	<div class="control-group ">
		<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'nombre', 'error')} required">
			<label  class="control-label" for="nombre">
				<g:message code="administrador.nombre.label" default="Nombre" />
			</label>
			<div class="controls">
				<g:textField name="nombre" maxlength="50" required="" value="${administradorInstance?.nombre}"/>
			</div>					
		</div>
	</div>
	<div class="control-group ">
		<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'apellido', 'error')} required">
			<label  class="control-label" for="apellido">
				<g:message code="administrador.apellido.label" default="Apellido" />
			</label>
			<div class="controls">
				<g:textField name="apellido" maxlength="50" required="" value="${administradorInstance?.apellido}"/>
			</div>					
		</div>
	</div>
	<div class="control-group ">
		<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'correo', 'error')} required">
			<label  class="control-label" for="correo">
				<g:message code="administrador.correo.label" default="Correo" />
			</label>
			<div class="controls">
				<g:field type="email" name="correo" required="" value="${administradorInstance?.correo}"/>
			</div>					
		</div>
	</div>
	<div class="control-group ">
		<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'edad', 'error')} required">
			<label  class="control-label" for="edad">
				<g:message code="administrador.edad.label" default="Edad" />
			</label>
			<div class="controls">
				<g:field name="edad" type="number" value="${administradorInstance.edad}" required=""/>
			</div>					
		</div>
	</div>
