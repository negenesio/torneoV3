package com.torneo.fifa



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional


@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class CruceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cruce.list(params), model:[cruceInstanceCount: Cruce.count()]
    }

    def show(Cruce cruceInstance) {
        respond cruceInstance
    }

    def create() {
        respond new Cruce(params)
    }

    @Transactional
    def save(Cruce cruceInstance) {
        if (cruceInstance == null) {
            notFound()
            return
        }

        if (cruceInstance.hasErrors()) {
            respond cruceInstance.errors, view:'create'
            return
        }

        cruceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cruce.label', default: 'Cruce'), cruceInstance.id])
                redirect cruceInstance
            }
            '*' { respond cruceInstance, [status: CREATED] }
        }
    }

    def edit(Cruce cruceInstance) {
        respond cruceInstance
    }

    @Transactional
    def update(Cruce cruceInstance) {
        if (cruceInstance == null) {
            notFound()
            return
        }

        if (cruceInstance.hasErrors()) {
            respond cruceInstance.errors, view:'edit'
            return
        }

        cruceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cruce.label', default: 'Cruce'), cruceInstance.id])
                redirect cruceInstance
            }
            '*'{ respond cruceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Cruce cruceInstance) {

        if (cruceInstance == null) {
            notFound()
            return
        }

        cruceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cruce.label', default: 'Cruce'), cruceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cruce.label', default: 'Cruce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
