<%--DATOS ADMINISTRADOR--%>
<g:if test="${administradorInstance?.cedula}">
	<dt><g:message code="administrador.cedula.label" default="Cedula" /></dt>						
		<dd><g:fieldValue bean="${administradorInstance}" field="cedula"/></dd>						
</g:if>				
<g:if test="${administradorInstance?.nombre}">
	<dt><g:message code="administrador.nombre.label" default="Nombre" /></dt>						
		<dd><g:fieldValue bean="${administradorInstance}" field="nombre"/></dd>						
</g:if>				
<g:if test="${administradorInstance?.apellido}">
	<dt><g:message code="administrador.apellido.label" default="Apellido" /></dt>						
		<dd><g:fieldValue bean="${administradorInstance}" field="apellido"/></dd>						
</g:if>				
<g:if test="${administradorInstance?.correo}">
	<dt><g:message code="administrador.correo.label" default="Correo" /></dt>						
		<dd><g:fieldValue bean="${administradorInstance}" field="correo"/></dd>						
</g:if>
<g:if test="${administradorInstance?.edad}">
	<dt><g:message code="administrador.edad.label" default="Edad" /></dt>
		<dd><g:fieldValue bean="${administradorInstance}" field="edad"/></dd>
</g:if>
<%--DATOS ENTRENADOR--%>
<g:if test="${entrenadorInstance?.cedula}">
	<dt><g:message code="entrenador.cedula.label" default="Cedula" /></dt>	
		<dd><g:fieldValue bean="${entrenadorInstance}" field="cedula"/></dd>	
</g:if>
<g:if test="${entrenadorInstance?.nombre}">
	<dt><g:message code="entrenador.nombre.label" default="Nombre" /></dt>	
		<dd><g:fieldValue bean="${entrenadorInstance}" field="nombre"/></dd>	
</g:if>
<g:if test="${entrenadorInstance?.apellido}">
	<dt><g:message code="entrenador.apellido.label" default="Apellido" /></dt>	
		<dd><g:fieldValue bean="${entrenadorInstance}" field="apellido"/></dd>	
</g:if>
<g:if test="${entrenadorInstance?.correo}">
	<dt><g:message code="entrenador.correo.label" default="Correo" /></dt>	
		<dd><g:fieldValue bean="${entrenadorInstance}" field="correo"/></dd>	
</g:if>
<g:if test="${entrenadorInstance?.edad}">
	<dt><g:message code="entrenador.edad.label" default="Edad" /></dt>	
		<dd><g:fieldValue bean="${entrenadorInstance}" field="edad"/></dd>	
</g:if>
<g:if test="${entrenadorInstance?.campoLaboral}">
	<dt><g:message code="entrenador.campoLaboral.label" default="Campo Laboral" /></dt>	
		<dd><g:fieldValue bean="${entrenadorInstance}" field="campoLaboral"/></dd>	
</g:if>
<%--DATOS USUARIO--%>
<g:if test="${usuarioInstance?.nombre}">
	<dt><g:message code="usuario.nombre.label" default="Nombre" /></dt>						
	<dd><g:fieldValue bean="${usuarioInstance}" field="nombre"/></dd>						
</g:if>				
<g:if test="${usuarioInstance?.apellido}">
	<dt><g:message code="usuario.apellido.label" default="Apellido" /></dt>						
	<dd><g:fieldValue bean="${usuarioInstance}" field="apellido"/></dd>						
</g:if>				
<g:if test="${usuarioInstance?.correo}">
	<dt><g:message code="usuario.correo.label" default="Correo" /></dt>						
	<dd><g:fieldValue bean="${usuarioInstance}" field="correo"/></dd>						
</g:if>
<g:if test="${usuarioInstance?.edad}">
	<dt><g:message code="usuario.edad.label" default="Edad" /></dt>
	<dd><g:fieldValue bean="${usuarioInstance}" field="edad"/></dd>
</g:if>				
<g:if test="${usuarioInstance?.peso}">
	<dt><g:message code="usuario.peso.label" default="Peso" /></dt>						
	<dd><g:fieldValue bean="${usuarioInstance}" field="peso"/></dd>						
</g:if>				
<g:if test="${usuarioInstance?.altura}">
	<dt><g:message code="usuario.altura.label" default="Altura" /></dt>						
	<dd><g:fieldValue bean="${usuarioInstance}" field="altura"/></dd>						
</g:if>				
<g:if test="${usuarioInstance?.imc}">
	<dt><g:message code="usuario.imc.label" default="Imc" /></dt>						
	<dd><g:fieldValue bean="${usuarioInstance}" field="imc"/></dd>						
</g:if>