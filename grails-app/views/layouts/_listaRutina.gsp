
<div id="rutinaList" class="accordion-body collapse">
	<ul class="pull-right">
	  <div class="dropdown">
	    <a  href="#" id="drop3" role="button" class="dropdown-toggle btn btn-small" data-toggle="dropdown"><b class="caret"></b> Mas acciones</a>
	    <ul class="dropdown-menu " role="menu" aria-labelledby="drop3">
	      <li><a tabindex="-1" href="${createLink(controller:'rutina', action:'create')}">Crear</a></li>
	      <li><a tabindex="-1" href="${createLink(controller:'rutina', action:'show')}">Buscar</a></li>	      
	    </ul>
	  </div>
	</ul>	
  	<div class="accordion-inner">	
		<table class="table table-striped">
			<thead>
				<tr>
					<g:sortableColumn property="usuario" title="${message(code: 'rutina.usuario.label', default: 'Usuario')}" />
					<g:sortableColumn property="grupo" title="${message(code: 'rutina.grupo.label', default: 'Grupo')}" />						
					<g:sortableColumn property="objetivo" title="${message(code: 'rutina.objetivo.label', default: 'Objetivo')}" />											
					<g:sortableColumn property="periodo" title="${message(code: 'rutina.periodo.label', default: 'Periodo')}" />												
					<th></th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${rutinaInstanceList}" var="rutinaInstance">
				<tr>	
					<g:if test="${rutinaInstance?.usuario}" >
						<td class="link">
							<g:link controller="usuario" action="show" id="${rutinaInstance?.usuario?.id}">${rutinaInstance?.usuario?.encodeAsHTML()}</g:link>
						</td>
					</g:if>					
					<td>${fieldValue(bean: rutinaInstance, field: "grupo")}</td>						
					<td>${fieldValue(bean: rutinaInstance, field: "objetivo")}</td>								
					<td>${fieldValue(bean: rutinaInstance, field: "periodo")}</td>	
					<td class="link">
						<g:link action="show" id="${rutinaInstance.id}" class="btn btn-small">Show &raquo;</g:link>
					</td>
				</tr>
			</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<bootstrap:paginate total="${rutinaInstanceTotal}" />
		</div>
  	</div>
</div>