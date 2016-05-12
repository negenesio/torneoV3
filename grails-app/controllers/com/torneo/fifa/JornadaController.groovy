package com.torneo.fifa



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['IS_AUTHENTICATED_FULLY'])
class JornadaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

//    def index(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond Jornada.list(params), model:[jornadaInstanceCount: Jornada.count()]
//    }
//	def index(Integer max) {
//		params.max = Math.min(max ?: 32, 100)
//
//		def criteria = Jornada.createCriteria()
//		def jornadaInstanceList = criteria.list{
//			torneoRegistracion{
//				eq('id', params.torneoRegistracionInstanceId.toLong())
//			}
//		}
//		println jornadaInstanceList.size()
//		respond jornadaInstanceList, model:[jornadaInstanceCount: Jornada.count()]
//	}

    def show(Jornada jornadaInstance) {
        respond jornadaInstance
    }

    def create() {
        respond new Jornada(params)
    }

    @Transactional
    def save(Jornada jornadaInstance) {
        if (jornadaInstance == null) {
            notFound()
            return
        }

        if (jornadaInstance.hasErrors()) {
            respond jornadaInstance.errors, view:'create'
            return
        }

        jornadaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'jornada.label', default: 'Jornada'), jornadaInstance.id])
                redirect jornadaInstance
            }
            '*' { respond jornadaInstance, [status: CREATED] }
        }
    }

    def edit(Jornada jornadaInstance) {
        respond jornadaInstance
    }

    @Transactional
    def update(Jornada jornadaInstance) {
        if (jornadaInstance == null) {
            notFound()
            return
        }

        if (jornadaInstance.hasErrors()) {
            respond jornadaInstance.errors, view:'edit'
            return
        }

        jornadaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Jornada.label', default: 'Jornada'), jornadaInstance.id])
                redirect jornadaInstance
            }
            '*'{ respond jornadaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Jornada jornadaInstance) {

        if (jornadaInstance == null) {
            notFound()
            return
        }

        jornadaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Jornada.label', default: 'Jornada'), jornadaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'jornada.label', default: 'Jornada'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
