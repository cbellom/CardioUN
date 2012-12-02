<div id="citaList" class="accordion-body collapse">
	<ul class="pull-right">
	  <div class="dropdown">
	    <a  href="#" id="drop3" role="button" class="dropdown-toggle btn btn-small" data-toggle="dropdown"><b class="caret"></b> Mas acciones</a>
	    <ul class="dropdown-menu " role="menu" aria-labelledby="drop3">
	      <li><a tabindex="-1" href="${createLink(controller:'cita', action:'horario')}">Ver Horario</a></li>    
	    </ul>
	  </div>
	</ul>
  	<div class="accordion-inner">	
		<table class="table table-striped">
			<thead>
				<tr>								
					<g:sortableColumn property="fechaInicial" title="${message(code: 'cita.fechaInicial.label', default: 'Fecha Inicial')}" />
					<th class="header"><g:message code="cita.entrenador.label" default="Entrenador" /></th>					
					<th></th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${usuarioInstance?.citas}" var="citaInstance">
				<tr>						
					<td><g:formatDate date="${citaInstance.fechaInicial}" /></td>	
					<td>${fieldValue(bean: citaInstance, field: "entrenador")}</td>					
					<td class="link">
						<g:if test="${new Date()+1<citaInstance?.fechaInicial}">
							<g:link action="cancelarCita" id="${citaInstance.id}" class="btn btn-danger"><i class="icon-trash icon-white"></i> Cancelar</g:link>
						</g:if>
					</td>
				</tr>
			</g:each>
			</tbody>
		</table>
  	</div>
</div>