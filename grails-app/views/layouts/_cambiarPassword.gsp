

<div id="myModalPassword" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none; ">
    
    <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h3 id="myModalLabel">Cambiar mi Contraseña</h3>
	</div>			
	
	<div class="modal-body">	
		<g:if test="${administradorInstance?.cedula}">
			<div class="control-group ">
				<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'oldPassword', 'error')} required">				
					<div class="controls">	
						<g:field type="password" required=""  placeholder="Antigua Contraseña" name='oldPassword' id='oldPassword'/>
					</div>
				</div>	
			</div>		
			<div class="control-group ">
				<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'newPassword', 'error')} required">
					<div class="controls">
						<g:field type="password"  required=""  placeholder="Nueva Contraseña" name='newPassword' id='newPassword'/>
					</div>		
				</div>	
			</div>
			<div class="control-group ">
				<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'confirmNewPassword', 'error')} required">					
					<div class="controls">
						<g:field type="password" required="" placeholder="Confirmar Nueva Contraseña" name='confirmNewPassword' id='confirmNewPassword'/>
					</div>		
				</div>	
			</div>				
		</g:if>	
		
		<g:if test="${usuarioInstance?.cedula}">
			<div class="control-group ">
				<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'oldPassword', 'error')} required">
					<div class="controls">
						<g:field type="password" required=""  placeholder="Antigua Contraseña" name='oldPassword' id='oldPassword'/>
					</div>		
				</div>	
			</div>	
			<div class="control-group ">		
				<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'newPassword', 'error')} required">
					<div class="controls">
						<g:field type="password"  required=""  placeholder="Nueva Contraseña" name='newPassword' id='newPassword'/>
					</div>		
				</div>	
			</div>
			<div class="control-group ">
				<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'confirmNewPassword', 'error')} required">
					<div class="controls">
						<g:field type="password" required="" placeholder="Confirmar Nueva Contraseña" name='confirmNewPassword' id='confirmNewPassword'/>
					</div>		
				</div>	
			</div>
		</g:if>	
						
		<g:if test="${entrenadorInstance?.cedula}">
			<div class="control-group ">
				<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'oldPassword', 'error')} required">
					<div class="controls">
						<g:field type="password" required=""  placeholder="Antigua Contraseña" name='oldPassword' id='oldPassword'/>
					</div>		
				</div>	
			</div>	
			<div class="control-group ">	
				<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'newPassword', 'error')} required">
					<div class="controls">
						<g:field type="password"  required=""  placeholder="Nueva Contraseña" name='newPassword' id='newPassword'/>
					</div>		
				</div>	
			</div>
			<div class="control-group ">
				<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'confirmNewPassword', 'error')} required">
					<div class="controls">
						<g:field type="password" required="" placeholder="Confirmar Nueva Contraseña" name='confirmNewPassword' id='confirmNewPassword'/>
					</div>		
				</div>	
			</div>	
		</g:if>	
	</div>	
	
	<div class="modal-footer">
		<button class="btn btn-danger" data-dismiss="modal"><i class="icon-remove icon-white"></i> Cancelar</button>
		<button class="btn btn-inverse" type="submit"><i class="icon-ok icon-white"></i> Cambiar</button>
	</div>				
</div>