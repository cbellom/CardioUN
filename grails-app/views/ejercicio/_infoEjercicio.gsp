
<div id="ejercicioVer" >			
	<div class="row-fluid">	
		<g:if test="${ejercicioInstance?.id}">
		<div class="span4">
			<img class="img-polaroid" style="width:275px;" src="${createLink(controller:'imagen', action:'showImagenEjercicio', params: [id:ejercicioInstance?.id ]) }">
		</div>			
		</g:if>
		<div class="span5">
			<g:if test="${ejercicioInstance?.nombre}">
				<dt><g:message code="ejercicio.nombre.label" default="Nombre" /></dt>				
					<dd><g:fieldValue bean="${ejercicioInstance}" field="nombre"/></dd>				
			</g:if>			
			<g:if test="${ejercicioInstance?.entrenador}">
				<dt><g:message code="ejercicio.entrenador.label" default="Entrenador" /></dt>				
					<dd><g:link controller="entrenador" action="show" id="${ejercicioInstance?.entrenador?.id}">${ejercicioInstance?.entrenador?.encodeAsHTML()}</g:link></dd>
			</g:if>	
			<g:if test="${ejercicioInstance?.descripcion}">
				<dt><g:message code="ejercicio.descripcion.label" default="Descripcion" /></dt>				
					<dd>${ejercicioInstance?.descripcion}</dd>					
			</g:if>					
			<sec:ifAllGranted roles="ROLE_COACH">
				<g:if test="${ejercicioInstance?.nombre}">
					<g:form>			
						<g:hiddenField name="id" value="${ejercicioInstance?.id}" />
						<sec:ifAllGranted roles="ROLE_COACH">
							<div class="form-actions">
								<g:link class="btn btn-inverse" action="edit" id="${ejercicioInstance?.id}">
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