<div class="page-header">
	<h1>${fieldValue(bean: maquinaInstance, field: "tipo")}</h1>
</div>

<div id="maquinaVer" >			
	<div class="row-fluid">	
		<g:if test="${maquinaInstance?.id}">
		<div class="span4">
			<img class="img-polaroid" style="width:275px;" src="${createLink(controller:'imagen', action:'showImagenMaquina', params: [id:maquinaInstance?.id ]) }">
		</div>			
		
		
		
		</g:if>
		<div class="span5">
			<g:if test="${maquinaInstance?.tipo}">
				<dt><g:message code="maquina.tipo.label" default="Tipo" /></dt>				
					<dd><g:fieldValue bean="${maquinaInstance}" field="tipo"/></dd>				
			</g:if>			
			<g:if test="${maquinaInstance?.marca}">
				<dt><g:message code="maquina.marca.label" default="Marca" /></dt>				
					<dd><g:fieldValue bean="${maquinaInstance}" field="marca"/></dd>				
			</g:if>		
			<g:if test="${maquinaInstance?.modelo}">
				<dt><g:message code="maquina.modelo.label" default="Modelo" /></dt>				
					<dd><g:fieldValue bean="${maquinaInstance}" field="modelo"/></dd>				
			</g:if>			
			<g:if test="${maquinaInstance?.observacion}">
				<dt><g:message code="maquina.observacion.label" default="Observacion" /></dt>				
					<dd><g:fieldValue bean="${maquinaInstance}" field="observacion"/></dd>				
			</g:if>
			<g:if test="${maquinaInstance?.numero}">
				<dt><g:message code="maquina.numero.label" default="Numero" /></dt>				
					<dd><g:fieldValue bean="${maquinaInstance}" field="numero"/></dd>				
			</g:if>			
			<g:if test="${maquinaInstance?.placaReferencia}">
				<dt><g:message code="maquina.placaReferencia.label" default="PlacaReferencia" /></dt>				
					<dd><g:fieldValue bean="${maquinaInstance}" field="placaReferencia"/></dd>				
			</g:if>
			<g:if test="${maquinaInstance?.entrenador}">
				<dt><g:message code="maquina.entrenador.label" default="Entrenador" /></dt>				
					<dd><g:link controller="entrenador" action="show" id="${maquinaInstance?.entrenador?.id}">${maquinaInstance?.entrenador?.encodeAsHTML()}</g:link></dd>
			</g:if>	
			<sec:ifAllGranted roles="ROLE_COACH">
				<g:if test="${maquinaInstance?.tipo}">
					<g:form>			
						<g:hiddenField name="id" value="${maquinaInstance?.id}" />
							<sec:ifAllGranted roles="ROLE_COACH">
								<div class="form-actions">
									<g:link class="btn btn-inverse" action="edit" id="${maquinaInstance?.id}">
										<i class="icon-pencil icon-white"></i>
										<g:message code="default.button.edit.label" default="Edit" />
									</g:link>
								</div>
							</sec:ifAllGranted>
						</g:form>	
					</g:if>		
			</sec:ifAllGranted>
		</div>		
	</div>	
</div>