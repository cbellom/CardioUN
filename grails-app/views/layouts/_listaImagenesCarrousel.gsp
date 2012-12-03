<div id="imageCarrouselList" class="accordion-body collapse">
  	<div class="accordion-inner">			
		<table class="table table-striped">
			<thead>
				<tr>
					<g:sortableColumn property="titulo" title="${message(code: 'imagenCarrousel.titulo.label', default: 'Titulo')}" />
					<g:sortableColumn property="descripcion" title="${message(code: 'imagenCarrousel.descripcion.label', default: 'Descripcion')}" />
					<th class="header"><g:message code="imagenCarrousel.imagen.label" default="Imagen" /></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${imagenCarrouselInstanceList}" var="imagenCarrouselInstance">
				<tr>
					<td>${fieldValue(bean: imagenCarrouselInstance, field: "titulo")}</td>				
					<td>${fieldValue(bean: imagenCarrouselInstance, field: "descripcion")}</td>				
					<td>
						<img class="img-polaroid" style="width:50px;" src="${createLink(controller:'imagen', action:'show',params: [id:imagenCarrouselInstance?.imagen.id ]) }">
					</td>
				
					<td class="link">
						<g:form controller="imagenCarrousel" action="delete">
							<g:hiddenField name="id" value="${imagenCarrouselInstance?.imagen.id}" />
							<button class="btn btn-danger" type="submit" name="_action_delete">
								<i class="icon-trash icon-white"></i>
								<g:message code="default.button.delete.label" default="Delete" />
							</button>
						</g:form>
					</td>
				</tr>
			</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<bootstrap:paginate total="${imagenCarrouselInstanceTotal}" />
		</div>
		
		<fieldset>
			<g:form class="form-horizontal" controller="imagenCarrousel" action="create" enctype="multipart/form-data">
				<fieldset>
					<g:render template="/imagenCarrousel/form"/>
					<div class="form-actions">
						<button type="submit" class="btn btn-inverse">
							<i class="icon-ok icon-white"></i>
							<g:message code="default.button.create.label" default="Create" />
						</button>
					</div>
				</fieldset>
			</g:form>
		</fieldset>
		
		
  	</div>
</div>


