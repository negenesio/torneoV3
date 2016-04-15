package com.torneo.fifa



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)

class PlayerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	@Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Player.list(params), model:[playerInstanceCount: Player.count()]
    }
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def indexPlayer(){
		
	}

	@Secured(['ROLE_ADMIN'])
    def show(Player playerInstance) {
        respond playerInstance
    }

	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def create() {
        respond new Player(params)
    }

	@Secured(['ROLE_ADMIN'])
    @Transactional
    def save(Player playerInstance) {
        if (playerInstance == null) {
            notFound()
            return
        }

        if (playerInstance.hasErrors()) {
            respond playerInstance.errors, view:'create'
            return
        }

        playerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'player.label', default: 'Player'), playerInstance.id])
                redirect playerInstance
            }
            '*' { respond playerInstance, [status: CREATED] }
        }
    }

	@Secured(['ROLE_ADMIN'])
    def edit(Player playerInstance) {
        respond playerInstance
    }

	@Secured(['ROLE_ADMIN'])
    @Transactional
    def update(Player playerInstance) {
        if (playerInstance == null) {
            notFound()
            return
        }

        if (playerInstance.hasErrors()) {
            respond playerInstance.errors, view:'edit'
            return
        }

        playerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Player.label', default: 'Player'), playerInstance.id])
                redirect playerInstance
            }
            '*'{ respond playerInstance, [status: OK] }
        }
    }

	@Secured(['ROLE_ADMIN'])
    @Transactional
    def delete(Player playerInstance) {

        if (playerInstance == null) {
            notFound()
            return
        }

        playerInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Player.label', default: 'Player'), playerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'player.label', default: 'Player'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
