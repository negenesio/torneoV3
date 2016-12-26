import java.util.Date;

import com.torneo.fifa.Role
import com.torneo.fifa.Player
import com.torneo.fifa.UserRole

class BootStrap {

    def init = { servletContext ->
		
		def adminRole = Role.findOrSaveWhere(authority:"ROLE_ADMIN")
		def userRole = Role.findOrSaveWhere(authority:"ROLE_USER")
//		
		def userAdmin = Player.findOrSaveWhere(username:"admin", password:"admin", nombre:"admin", apellido:"admin", email:"nicolas.genesio@gmail.com", fechaNacimiento:new Date(), fechaCreacion:new Date(), enabled:true, codigoDesbloqueo:"123")
		def userUser = Player.findOrSaveWhere(username:"nicogenesio", password:"nicogenesio", nombre:"Nicolas", apellido:"Genesio", email:"nicolas.genesio@mercadolibre.com", fechaNacimiento:new Date(), fechaCreacion:new Date(), codigoDesbloqueo:"123", enabled:true)
		def userUser1 = Player.findOrSaveWhere(username:"user1", password:"user1", nombre:"user1", apellido:"user1", email:"user1@mercadolibre.com", fechaNacimiento:new Date(), fechaCreacion:new Date(), codigoDesbloqueo:"123", enabled:true)
		def userUser2 = Player.findOrSaveWhere(username:"user2", password:"user2", nombre:"user2", apellido:"user2", email:"user2@mercadolibre.com", fechaNacimiento:new Date(), fechaCreacion:new Date(), codigoDesbloqueo:"123", enabled:true)
		def userUser3 = Player.findOrSaveWhere(username:"user3", password:"user3", nombre:"user3", apellido:"user3", email:"user3@mercadolibre.com", fechaNacimiento:new Date(), fechaCreacion:new Date(), codigoDesbloqueo:"123", enabled:true)
		def userUser4 = Player.findOrSaveWhere(username:"user4", password:"user4", nombre:"user4", apellido:"user4", email:"user4@mercadolibre.com", fechaNacimiento:new Date(), fechaCreacion:new Date(), codigoDesbloqueo:"123", enabled:true)
//		

			UserRole.create(Player.findByUsername('admin'), adminRole, true)
		
			UserRole.create(Player.findByUsername('user'), userRole, true)
		
			UserRole.create(Player.findByUsername('user1'), userRole, true)
		
			UserRole.create(Player.findByUsername('user2'), userRole, true)
		
		
			UserRole.create(Player.findByUsername('user3'), userRole, true)
		
		
			UserRole.create(Player.findByUsername('user4'), userRole, true)
		
    }
    def destroy = {
    }
}
