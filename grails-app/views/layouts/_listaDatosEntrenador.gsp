
<div id="coachList" class="accordion-body collapse">
	<ul class="pull-right">
	  <div class="dropdown">
	    <a  href="#" id="drop3" role="button" class="dropdown-toggle btn btn-small" data-toggle="dropdown"><b class="caret"></b> Mas acciones</a>
	    <ul class="dropdown-menu " role="menu" aria-labelledby="drop3">
	      <li><a tabindex="-1" href="${createLink(controller:'entrenador', action:'create')}">Crear</a></li>
	      <li><a tabindex="-1" href="${createLink(controller:'entrenador', action:'show')}">Buscar</a></li>
	    </ul>
	  </div>
	</ul>
  	<div class="accordion-inner">
		<table class="table table-striped">
			<thead>
				<tr>				
					<g:sortableColumn property="cedula" title="${message(code: 'entrenador.cedula.label', default: 'Cedula')}" />				
					<g:sortableColumn property="nombre" title="${message(code: 'entrenador.nombre.label', default: 'Nombre')}" />				
					<g:sortableColumn property="apellido" title="${message(code: 'entrenador.apellido.label', default: 'Apellido')}" />				
					<g:sortableColumn property="correo" title="${message(code: 'entrenador.correo.label', default: 'Correo')}" />					
					<g:sortableColumn property="edad" title="${message(code: 'entrenador.edad.label', default: 'Edad')}" />				
					<th></th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${entrenadorInstanceList}" var="entrenadorInstance">
				<tr>				
					<td>${fieldValue(bean: entrenadorInstance, field: "cedula")}</td>				
					<td>${fieldValue(bean: entrenadorInstance, field: "nombre")}</td>				
					<td>${fieldValue(bean: entrenadorInstance, field: "apellido")}</td>				
					<td>${fieldValue(bean: entrenadorInstance, field: "correo")}</td>				
					<td>${fieldValue(bean: entrenadorInstance, field: "edad")}</td>				
					<td class="link">
						<g:link controller="entrenador" action="show" id="${entrenadorInstance.id}" class="btn btn-small">Show &raquo;</g:link>
					</td>
				</tr>
			</g:each>
		</tbody>
		<div class="pagination">
			<bootstrap:paginate total="${entrenadorInstanceTotal}" />
		</div>
	</table>
  	</div>
</div>