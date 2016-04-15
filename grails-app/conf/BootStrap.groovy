import com.torneo.fifa.Role
import com.torneo.fifa.Player
import com.torneo.fifa.UserRole

class BootStrap {

    def init = { servletContext ->
		
		def adminRole = Role.findOrSaveWhere(authority:"ROLE_ADMIN")
		def userAdmin = Player.findOrSaveWhere(username:"admin", password:"admin", nombre:"admin", apellido:"admin", email:"nicolas.genesio@gmail.com", fechaNacimiento:new Date(), fechaCreacion:new Date())
		def userRole = Role.findOrSaveWhere(authority:"ROLE_USER")
		def userUser = Player.findOrSaveWhere(username:"nicogenesio", password:"nicogenesio", nombre:"Nicolas", apellido:"Genesio", email:"nicolas.genesio@mercadolibre.com", fechaNacimiento:new Date(), fechaCreacion:new Date())
		
		if(!userAdmin.authorities.contains(adminRole)){
			UserRole.create(userAdmin, adminRole, true)
		}
		if(!userUser.authorities.contains(userRole)){
			UserRole.create(userUser, userRole, true)
		}
		
    }
    def destroy = {
    }
}
