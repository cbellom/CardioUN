
<div id="userList" class="accordion-body collapse">
	<ul class="pull-right">
	  <div class="dropdown">
	    <a  href="#" id="drop3" role="button" class="dropdown-toggle btn btn-small" data-toggle="dropdown"><b class="caret"></b> Mas acciones</a>
	    <ul class="dropdown-menu " role="menu" aria-labelledby="drop3">
	      <li><a tabindex="-1" href="${createLink(controller:'usuario', action:'create')}">Crear</a></li>
	      <li><a tabindex="-1" href="${createLink(controller:'usuario', action:'buscarPorCedula',params: [cedula:0 ])}">Buscar</a></li>
	      <li class="divider"></li>
	      <li><a tabindex="-1" href="${createLink(controller:'asistencia', action:'list')}">Asistencias</a></li>
	      <li><a tabindex="-1" href="${createLink(controller:'pruebaValoracion', action:'buscarPorUsuarioFecha')}">Pruebas Realizadas</a></li>
	      <li><a tabindex="-1" href="${createLink(controller:'cita', action:'horario')}">Citas Programadas</a></li>	      
	    </ul>
	  </div>
	</ul>	
  	<div class="accordion-inner">	
		<table class="table table-striped">
			<thead>
				<tr>				
					<g:sortableColumn property="cedula" title="${message(code: 'usuario.cedula.label', default: 'Cedula')}" />
					<g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}" />				
					<g:sortableColumn property="apellido" title="${message(code: 'usuario.apellido.label', default: 'Apellido')}" />				
					<g:sortableColumn property="correo" title="${message(code: 'usuario.correo.label', default: 'Correo')}" />						
					<g:sortableColumn property="edad" title="${message(code: 'usuario.edad.label', default: 'Edad')}" />				
					<th></th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${usuarioInstanceList}" var="usuarioInstance">
				<tr>				
					<td>${fieldValue(bean: usuarioInstance, field: "cedula")}</td>				
					<td>${fieldValue(bean: usuarioInstance, field: "nombre")}</td>				
					<td>${fieldValue(bean: usuarioInstance, field: "apellido")}</td>				
					<td>${fieldValue(bean: usuarioInstance, field: "correo")}</td>					
					<td>${fieldValue(bean: usuarioInstance, field: "edad")}</td>				
					<td class="link">
						<g:link controller="usuario" action="show" id="${usuarioInstance.id}" class="btn btn-small">Show &raquo;</g:link>
					</td>
				</tr>
			</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<bootstrap:paginate total="${usuarioInstanceTotal}" />
		</div>
  	</div>
</div>