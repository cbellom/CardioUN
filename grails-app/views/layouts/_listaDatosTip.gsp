<div id="tipList" class="accordion-body collapse">
	<ul class="pull-right">
	  <div class="dropdown">
	    <a  href="#" id="drop3" role="button" class="dropdown-toggle btn btn-small" data-toggle="dropdown"><b class="caret"></b> Mas acciones</a>
	    <ul class="dropdown-menu " role="menu" aria-labelledby="drop3">
	      <li><a tabindex="-1" href="${createLink(controller:'tip', action:'create')}">Crear</a></li>
	      <li><a tabindex="-1" href="${createLink(controller:'tip', action:'buscarPorEntrenador',params: [cedula:entrenadorInstance?.cedula ])}">Buscar</a></li>	      
	    </ul>
	  </div>
	</ul>	
  	<div class="accordion-inner">	
		<table class="table table-striped">
			<thead>
				<tr>	
					<g:sortableColumn property="nombre" title="${message(code: 'tip.nombre.label', default: 'Nombre')}" />						
					<g:sortableColumn property="descripcion" title="${message(code: 'tip.descripcion.label', default: 'Descripcion')}" />						
					<th class="header"><g:message code="tip.entrenador.label" default="Entrenador" /></th>						
					<th></th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${tipInstanceList}" var="tipInstance">
				<tr>	
					<td>${fieldValue(bean: tipInstance, field: "nombre")}</td>						
					<td>${tipInstance?.descripcion}</td>						
					<td>${fieldValue(bean: tipInstance, field: "entrenador")}</td>	
					<g:if test="${tipInstance?.entrenador.cedula == entrenadorInstance?.cedula}" >
						<td class="link">
							<g:link controller="tip" action="edit" id="${tipInstance.id}" class="btn btn-small">Editar &raquo;</g:link>
						</td>
					</g:if>
				</tr>
			</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<bootstrap:paginate total="${tipInstanceTotal}" />
		</div>
  	</div>
</div>