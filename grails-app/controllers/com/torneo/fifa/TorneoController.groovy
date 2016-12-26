package com.torneo.fifa



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import com.torneo.fifa.Player

@Transactional(readOnly = true)

class TorneoController {
	def torneoRegistracionController
	def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	@Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Torneo.list(params), model:[torneoInstanceCount: Torneo.count()]
    }

	@Secured(['IS_AUTHENTICATED_FULLY'])
    def show(Torneo torneoInstance) {
        respond torneoInstance
    }

	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create() {
		if(!flash.params){
			def mensaje = ""
			flash.params = [error:mensaje, info:mensaje]
		}
    }

	@Secured(['IS_AUTHENTICATED_FULLY'])
    @Transactional
    def save(Torneo torneoInstance) {
        if (torneoInstance == null) {
            notFound()
            return
        }

        if (torneoInstance.hasErrors()) {
            respond torneoInstance.errors, view:'create'
            return
        }

        torneoInstance.save flush:true

        request.withFormat {
            form multipartForm {
				flash.params = [id:torneoInstance.id]
				redirect action:"registracionTorneo"
				return
            }
            '*' { respond torneoInstance, [status: CREATED] }
        }
    }

	@Secured(['ROLE_ADMIN'])
    def edit(Torneo torneoInstance) {
        respond torneoInstance
    }

	@Secured(['ROLE_ADMIN'])
    @Transactional
    def update(Torneo torneoInstance) {
        if (torneoInstance == null) {
            notFound()
            return
        }

        if (torneoInstance.hasErrors()) {
            respond torneoInstance.errors, view:'edit'
            return
        }

        torneoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Torneo.label', default: 'Torneo'), torneoInstance.id])
                redirect torneoInstance
            }
            '*'{ respond torneoInstance, [status: OK] }
        }
    }

	@Secured(['ROLE_ADMIN'])
    @Transactional
    def delete(Torneo torneoInstance) {

        if (torneoInstance == null) {
            notFound()
            return
        }

        torneoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Torneo.label', default: 'Torneo'), torneoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'torneo.label', default: 'Torneo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def registracionTorneo() {
		def criteria = Player.createCriteria()
		def player_lista = criteria.list(){
			eq('enabled', true)
		}
		def cantidadPlayer = params.int('cantidadPlayer')
		def descripcion = params.descripcion
		def nombre = params.nombre
		def password = params.password
		
		
		[cantidadPlayer:cantidadPlayer, player_lista:player_lista, password:password, nombre:nombre, descripcion:descripcion]
    }
	
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def publicarTorneo(){
		
		def criteria = Player.createCriteria()
		def player_lista = criteria.list{
			inList('id', params.playerInvitacion.collect { it.toLong() })
		}
		Torneo torneo = new Torneo()
		torneo.nombre = params.nombre
		torneo.descripcion = params.descripcion
		torneo.cantidadPlayer = player_lista.size()
		torneo.password = params.password
		
		Player owner = Player.findById(params.owner.toLong())
		
		torneo.owner = owner
		torneo.players = player_lista
		torneo.cantidadPlayer = params.cantidadPlayer
		if(torneo.cantidadPlayer == torneo.cantidadRegistrados){
			torneo.enabled = true
		}
		
		torneo.save flush:true
		redirect action:'indexPlayer', controller:'player'
	}
//		
//		List<Player> players = []
//		def lista_player = params.list('playerInvitacion')
//		lista_player.each { player ->
//			if(player != 'null'){
//				players << Player.findById(player)
//			}						
//		}
//		TorneoRegistracion torneoRegistracion = new TorneoRegistracion()
//		torneoRegistracion.players = players
//		torneoRegistracion.torneo = Torneo.findById(params.torneoInstance)
//		torneoRegistracion.cantidadRegistrados = players.size()
//		
//		if(lista_player.size() == players.size()){
//			torneoRegistracion.enabled = true
//		}else{
//			torneoRegistracion.enabled = false
//		}
//		torneoRegistracionController.save(torneoRegistracion)
//		
//	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def generarPlayers(){
	}
}
