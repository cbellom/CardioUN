import tpicardio.Administrador
import tpicardio.Entrenador
import tpicardio.Imagen
import tpicardio.Persona
import tpicardio.User
import tpicardio.UserRole
import tpicardio.UserUserRole
import tpicardio.Usuario

class BootStrap {
	def springSecurityService
	
    def init = { servletContext ->
		def userRole = UserRole.findByAuthority("ROLE_USER") ?: new UserRole(authority:"ROLE_USER").save();
		def adminRole = UserRole.findByAuthority("ROLE_ADMIN") ?: new UserRole(authority:"ROLE_ADMIN").save();
		def coachRole = UserRole.findByAuthority("ROLE_COACH") ?: new UserRole(authority:"ROLE_COACH").save();
					
		def administrador = new Administrador(username:"william",
									password:"password",
									cedula:79000000,
									edad:47,
									nombre:"William ",
									apellido:"Gutierres",
									correo:"cardiotpi@gmail.com",
									enabled:true).save()
		UserUserRole.create administrador, adminRole	
    }
    def destroy = {
    }
}
