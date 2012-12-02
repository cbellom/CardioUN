<div id="imageList" class="accordion-body collapse">

  	<div class="accordion-inner">	
		<table class="table table-striped">
			<thead>
				<tr>						
					<g:sortableColumn property="nombre" title="${message(code: 'imagen.nombre.label', default: 'Nombre')}" />						
					<th>Imagen</th>												
					<th></th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${imagenInstanceList}" var="imagenInstance">
				<tr>						
					<td>${fieldValue(bean: imagenInstance, field: "nombre")}</td>								
					<td>
						<img class="img-polaroid" style="width:50px;" src="${createLink(controller:'imagen', action:'show',params: [id:imagenInstance?.id ]) }">
					</td>						
					<td class="link">
						<g:form controller="imagen" action="delete">
							<g:hiddenField name="id" value="${imagenInstance?.id}" />
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
			<bootstrap:paginate total="${imagenInstanceTotal}" />
		</div>
		
		<g:form  controller="imagen" action="uploadImageDefaultProfile" method="post" enctype="multipart/form-data" >					
			<input type="file" name="myFile" id="myFile"/>									
			<button class="btn btn-inverse" type="submit"><i class="icon-ok icon-white"></i> Agregar Imagen</button>							
		</g:form>
		
		
  	</div>
</div>