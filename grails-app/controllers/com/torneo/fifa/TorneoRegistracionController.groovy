package com.torneo.fifa



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(['IS_AUTHENTICATED_FULLY'])
@Transactional(readOnly = true)
class TorneoRegistracionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TorneoRegistracion.list(params), model:[torneoRegistracionInstanceCount: TorneoRegistracion.count()]
    }

    def show(TorneoRegistracion torneoRegistracionInstance) {
        respond torneoRegistracionInstance
    }

    def create() {
        respond new TorneoRegistracion(params)
    }

    @Transactional
    def save(TorneoRegistracion torneoRegistracionInstance) {
        if (torneoRegistracionInstance == null) {
            notFound()
            return
        }

        if (torneoRegistracionInstance.hasErrors()) {
            respond torneoRegistracionInstance.errors, view:'create'
            return
        }

        torneoRegistracionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'torneoRegistracion.label', default: 'TorneoRegistracion'), torneoRegistracionInstance.id])
                redirect torneoRegistracionInstance
            }
            '*' { respond torneoRegistracionInstance, [status: CREATED] }
        }
    }

    def edit(TorneoRegistracion torneoRegistracionInstance) {
        respond torneoRegistracionInstance
    }

    @Transactional
    def update(TorneoRegistracion torneoRegistracionInstance) {
        if (torneoRegistracionInstance == null) {
            notFound()
            return
        }

        if (torneoRegistracionInstance.hasErrors()) {
            respond torneoRegistracionInstance.errors, view:'edit'
            return
        }

        torneoRegistracionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TorneoRegistracion.label', default: 'TorneoRegistracion'), torneoRegistracionInstance.id])
                redirect torneoRegistracionInstance
            }
            '*'{ respond torneoRegistracionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TorneoRegistracion torneoRegistracionInstance) {

        if (torneoRegistracionInstance == null) {
            notFound()
            return
        }

        torneoRegistracionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TorneoRegistracion.label', default: 'TorneoRegistracion'), torneoRegistracionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'torneoRegistracion.label', default: 'TorneoRegistracion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
