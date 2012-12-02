
<div class="well">
	<li class="nav-header">
		<a data-toggle="modal" href="#myModalImage"><img class="img-polaroid" style="width:190px; height:190px;" src="${createLink(controller:'imagen', action:'showImagen') }"></a>
		${entityName} (<sec:username/>)		
	</li> 
	<a data-toggle="modal" href="#myModalImage"><i class="icon-picture"></i> Cambiar mi imagen de Perfil</a>
</div>
<g:form controller="imagen" action="uploadImage" method="post" enctype="multipart/form-data">
<div id="myModalImage" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none; ">
    <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h3 id="myModalLabel">Cambiar mi imagen de perfil</h3>
	</div>
	<div class="modal-body">
		<input type="file" name="myFile" id="myFile"/><br></br>			
		<p class="muted">Selecciona la imagen que deseas colocar en tu perfil, posteriormente has click en el boton "Aceptar".</p>
	</div>
	<div class="modal-footer">	
		<button class="btn btn-danger" data-dismiss="modal"><i class="icon-remove icon-white"></i> Cancelar</button>	
		<button class="btn btn-inverse" type="submit"><i class="icon-ok icon-white"></i> Aceptar</button>	
	</div>	
</div>
</g:form>	