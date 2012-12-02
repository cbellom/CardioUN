
<div id="pruebaList" class="accordion-body collapse">
	<ul class="pull-right">
	  <div class="dropdown">
	    <a  href="#" id="drop3" role="button" class="dropdown-toggle btn btn-small" data-toggle="dropdown"><b class="caret"></b> Mas acciones</a>
	    <ul class="dropdown-menu " role="menu" aria-labelledby="drop3">
	    	<sec:ifAllGranted roles="ROLE_COACH">
	    		<li><a tabindex="-1" href="${createLink(controller:'pruebaValoracion', action:'create')}">Crear</a></li>	
	    	</sec:ifAllGranted>
	    	<li><a tabindex="-1" href="${createLink(controller:'pruebaValoracion', action:'buscarPorUsuarioFecha')}">Buscar</a></li>	    
	    	<sec:ifAllGranted roles="ROLE_COACH">
	    	<li><a tabindex="-1" href="${createLink(controller:'pruebaValoracion', action:'estadistica', params:[cedula:"0"])}">Estadisticas</a></li>
	    	</sec:ifAllGranted>
	    	<sec:ifAllGranted roles="ROLE_USER">
	    		<li><a tabindex="-1" href="${createLink(controller:'pruebaValoracion', action:'estadistica', params:[cedula:usuarioInstance.cedula])}">Estadisticas</a></li>
	    	</sec:ifAllGranted>
	    </ul>
	  </div>
	</ul>	
  	<div class="accordion-inner">	
		<table class="table table-striped">
			<thead>
				<tr>	
					<g:sortableColumn property="fecha" title="${message(code: 'pruebaValoracion.fecha.label', default: 'Fecha')}" />						
					<sec:ifAllGranted roles="ROLE_COACH">
						<g:sortableColumn property="usuario" title="${message(code: 'pruebaValoracion.usuario.label', default: 'Usuario')}" />
						<g:sortableColumn property="grupo" title="${message(code: 'pruebaValoracion.grupo.label', default: 'Grupo')}" />						
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_USER">
						<g:sortableColumn property="descripcionImc" title="${message(code: 'pruebaValoracion.descripcionImc.label', default: 'Descripcion Imc')}" />
						<g:sortableColumn property="descripcionPorcentajeGrasa" title="${message(code: 'pruebaValoracion.descripcionPorcentajeGrasa.label', default: 'Descripcion Porcentaje Grasa')}" />
						<g:sortableColumn property="descripcionFlexibilidad" title="${message(code: 'pruebaValoracion.descripcionFlexibilidad.label', default: 'Descripcion Flexibilidad')}" />						
						<g:sortableColumn property="descripcionVo2" title="${message(code: 'pruebaValoracion.descripcionVo2.label', default: 'Descripcion Vo2')}" />						
					</sec:ifAllGranted>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${pruebaValoracionInstanceList}" var="pruebaValoracionInstance">
				<tr>									
					<td>${fieldValue(bean: pruebaValoracionInstance, field: "fecha")}</td>
					<sec:ifAllGranted roles="ROLE_COACH">
						<td class="link">
							<g:link controller="usuario" action="show" id="${pruebaValoracionInstance?.usuario?.id}">${pruebaValoracionInstance?.usuario?.encodeAsHTML()}</g:link>
						</td>	
						<td>${fieldValue(bean: pruebaValoracionInstance, field: "grupo")}</td>	
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_USER">
						<td>${fieldValue(bean: pruebaValoracionInstance, field: "descripcionImc")}</td>						
						<td>${fieldValue(bean: pruebaValoracionInstance, field: "descripcionPorcentajeGrasa")}</td>						
						<td>${fieldValue(bean: pruebaValoracionInstance, field: "descripcionFlexibilidad")}</td>						
						<td>${fieldValue(bean: pruebaValoracionInstance, field: "descripcionVo2")}</td>	
					</sec:ifAllGranted>								
					<td class="link">
						<g:link controller="pruebaValoracion" action="show" id="${pruebaValoracionInstance.id}" class="btn btn-small">Show &raquo;</g:link>
					</td>
				</tr>
			</g:each>
			</tbody>
		</table>
		<sec:ifAllGranted roles="ROLE_COACH">
			<div class="pagination">
				<bootstrap:paginate total="${pruebaValoracionInstanceTotal}" />
			</div>
		</sec:ifAllGranted>
  	</div>
</div>