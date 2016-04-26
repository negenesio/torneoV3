package com.torneo.fifa



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

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
        respond new Torneo(params)
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
		 
		if(!flash.params){
			def mensaje = ""
			flash.params = [error:mensaje, info:mensaje]
		}
		if(flash.params.id != null){
			Torneo torneoInstance = Torneo.findById(flash.params.id)
			def criteria = Player.createCriteria()
			
			def player_lista = criteria.list(){
				eq('enabled', true)
			}
			model:[torneoInstance:torneoInstance, player_lista:player_lista]
		}else{
			flash.params = [error:"Primero debe crear un torneo."]
			redirect action:"create"
		}
		
    }
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	
	def publicarTorneo(){
		
		List<Player> players = []
		def lista_player = params.list('playerInvitacion')
		println "TAMAÑO: "+lista_player.size()
		lista_player.each { player ->
			if(player != 'null'){
				println player
				players << Player.findById(player)
			}						
		}
		TorneoRegistracion torneoRegistracion = new TorneoRegistracion()
		torneoRegistracion.players = players
		torneoRegistracion.torneo = Torneo.findById(params.torneoInstance)
		torneoRegistracion.cantidadRegistrados = players.size()
		
		if(lista_player.size() == players.size()){
			torneoRegistracion.enabled = true
		}else{
			torneoRegistracion.enabled = false
		}
		torneoRegistracionController.save(torneoRegistracion)
		
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def verificarParticipantes(){
		
	}
}
