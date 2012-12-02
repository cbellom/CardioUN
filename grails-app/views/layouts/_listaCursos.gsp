<div id="cursosList" class="accordion-body collapse">
  	<div class="accordion-inner">	
		<table class="table table-striped">
			<thead>
				<tr>				
					<g:sortableColumn property="nombre" title="${message(code: 'cursos.nombre.label', default: 'Nombre')}" />				
					<g:sortableColumn property="url" title="${message(code: 'cursos.url.label', default: 'Url')}" />				
					<th></th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${cursosInstanceList}" var="cursosInstance">
				<tr>				
					<td>${fieldValue(bean: cursosInstance, field: "nombre")}</td>				
					<td>${fieldValue(bean: cursosInstance, field: "url")}</td>				
					<td class="link">
						<g:form controller="cursos" action="delete">
							<g:hiddenField name="id" value="${cursosInstance?.id}" />
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
			<bootstrap:paginate total="${cursosInstanceTotal}" />
		</div>
		
		<g:form class="form-horizontal" controller="cursos" action="create">					
			<g:render template="/cursos/form"/>	
			<div class="form-actions">							
				<button class="btn btn-inverse" type="submit"><i class="icon-ok icon-white"></i> Agregar Curso</button>			
			</div>				
		</g:form>	
		
		
		
	</div>
</div>