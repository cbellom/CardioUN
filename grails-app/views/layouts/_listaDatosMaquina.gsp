
<div id="machineList" class="accordion-body collapse">
	<ul class="pull-right">
	  <div class="dropdown">
	    <a  href="#" id="drop3" role="button" class="dropdown-toggle btn btn-small" data-toggle="dropdown"><b class="caret"></b> Mas acciones</a>
	    <ul class="dropdown-menu " role="menu" aria-labelledby="drop3">
	      <li><a tabindex="-1" href="${createLink(controller:'maquina', action:'create')}">Crear</a></li>
	      <li><a tabindex="-1" href="${createLink(controller:'maquina', action:'show')}">Buscar</a></li>	      
	    </ul>
	  </div>
	</ul>	
  	<div class="accordion-inner">	
		<table class="table table-striped">
			<thead>
				<tr>						
					<g:sortableColumn property="imagen" title="${message(code: 'maquina.imagen.label', default: 'Imagen')}" />
					<g:sortableColumn property="marca" title="${message(code: 'maquina.marca.label', default: 'Marca')}" />				
					<g:sortableColumn property="modelo" title="${message(code: 'maquina.modelo.label', default: 'Modelo')}" />				
					<g:sortableColumn property="numero" title="${message(code: 'maquina.numero.label', default: 'Numero')}" />			
					<g:sortableColumn property="observacion" title="${message(code: 'maquina.observacion.label', default: 'Observacion')}" />				
					<th></th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${maquinaInstanceList}" var="maquinaInstance">
				<tr>				
					<td>${fieldValue(bean: maquinaInstance, field: "imagen")}</td>						
					<td>${fieldValue(bean: maquinaInstance, field: "marca")}</td>				
					<td>${fieldValue(bean: maquinaInstance, field: "modelo")}</td>				
					<td>${fieldValue(bean: maquinaInstance, field: "numero")}</td>				
					<td>${fieldValue(bean: maquinaInstance, field: "observacion")}</td>				
					<td class="link">
						<g:link action="show" id="${maquinaInstance.id}" class="btn btn-small">Show &raquo;</g:link>
					</td>
				</tr>
			</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<bootstrap:paginate total="${maquinaInstanceTotal}" />
		</div>
  	</div>
</div>