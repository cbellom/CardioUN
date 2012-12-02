<%@ page import="tpicardio.Entrenador" %>

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'username', 'error')} required">
		<label class="control-label" for="username">
			<g:message code="entrenador.username.label" default="Username" />
		</label>
		<div class="controls">	
			<g:textField name="username" maxlength="20" required="" value="${entrenadorInstance?.username}"/>
		</div>					
	</div>
</div>	

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'cedula', 'error')} required">
		<label class="control-label" for="cedula">
			<g:message code="entrenador.cedula.label" default="Cedula" />
		</label>
		<div class="controls">
			<g:field name="cedula" type="number" value="${entrenadorInstance.cedula}" required=""/>
		</div>					
	</div>
</div>	

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'nombre', 'error')} required">
		<label class="control-label" for="nombre">
			<g:message code="entrenador.nombre.label" default="Nombre" />
		</label>
		<div class="controls">
			<g:textField name="nombre" maxlength="50" required="" value="${entrenadorInstance?.nombre}"/>
		</div>					
	</div>
</div>	

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'apellido', 'error')} required">
		<label class="control-label" for="apellido">
			<g:message code="entrenador.apellido.label" default="Apellido" />
		</label>
		<div class="controls">
			<g:textField name="apellido" maxlength="50" required="" value="${entrenadorInstance?.apellido}"/>
		</div>					
	</div>
</div>	

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'correo', 'error')} required">
		<label class="control-label" for="correo">
			<g:message code="entrenador.correo.label" default="Correo" />
		</label>
		<div class="controls">
			<g:field type="email" name="correo" required="" value="${entrenadorInstance?.correo}"/>
		</div>					
	</div>
</div>	

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'edad', 'error')} required">
		<label class="control-label" for="edad">
			<g:message code="entrenador.edad.label" default="Edad" />
		</label>
		<div class="controls">
			<g:field name="edad" type="number" min="10" max="100" value="${entrenadorInstance.edad}" required=""/>
		</div>					
	</div>
</div>	

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'campoLaboral', 'error')} ">
		<label class="control-label" for="campoLaboral">
			<g:message code="entrenador.campoLaboral.label" default="Campo Laboral" />		
		</label>
		<div class="controls">
			<g:textField name="campoLaboral" value="${entrenadorInstance?.campoLaboral}"/>
		</div>					
	</div>
</div>	

<div class="control-group ">
	<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'imagen', 'error')} ">
		<label  class="control-label" for="imagen">
			<g:message code="entrenador.imagen.label" default="Imagen" />
		</label>
		<div class="controls">
			<g:select id="imagen" name="imagen.id" from="${listaImagenes}" optionKey="id" value="${entrenadorInstance?.imagen?.id}" class="many-to-one" noSelection="['null': '']"/>
		</div>					
	</div>
</div>
<%--<div class="control-group ">--%>
<%--	<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'cita', 'error')} ">--%>
<%--		<label class="control-label" for="cita">--%>
<%--			<g:message code="entrenador.cita.label" default="Cita" />	--%>
<%--		</label>--%>
<%--		<div class="controls">	--%>
<%--			<ul class="one-to-many">--%>
<%--				<g:each in="${entrenadorInstance?.cita?}" var="c">--%>
<%--				    <li><g:link controller="cita" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>--%>
<%--				</g:each>--%>
<%--				<li class="add">--%>
<%--					<g:link controller="cita" action="create" params="['entrenador.id': entrenadorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cita.label', default: 'Cita')])}</g:link>--%>
<%--				</li>--%>
<%--			</ul>		--%>
<%--		</div>					--%>
<%--	</div>--%>
<%--</div>	--%>

