package com.torneo.fifa

import static org.springframework.http.HttpStatus.*
import org.apache.commons.lang.RandomStringUtils
import org.apache.commons.logging.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import java.text.SimpleDateFormat

@Transactional(readOnly = true)

class PlayerController {
	
	private static Log log = LogFactory.getLog("pepito."+PlayerController.class.getName())
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def mailService
	
	@Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Player.list(params), model:[playerInstanceCount: Player.count()]
    }
	
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def indexPlayer(){
		if(!flash.params){
			def mensaje = ""
			flash.params = [error:mensaje, info:mensaje]
		}
	}

	@Secured(['ROLE_ADMIN'])
    def show(Player playerInstance) {
        respond playerInstance
    }

	@Secured(['permitAll'])
    def create() {
        respond new Player(params)
    }

	@Secured(['permitAll'])
    @Transactional
    def save(Player playerInstance) {
		log.info "Inicio de creacion de Player."
        if (playerInstance == null) {
            notFound()
            return
        }

        if (playerInstance.hasErrors()) {
            respond playerInstance.errors, view:'create'
            return
        }
		
        playerInstance.save flush:true
		def userRole = Role.findOrSaveWhere(authority:"ROLE_USER")
		UserRole.create(playerInstance, userRole, true)
		log.info "Creacion de Player y Rol exitoso: \nUsername: "+playerInstance.username+"\nEmail: "+playerInstance.email+"\nRol: "+userRole.authority
		enviarCodigo(playerInstance)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'player.label', default: 'Player'), playerInstance.id])
				flash.params = [info:"Creacion de usuario exitoso."]
                redirect controller:"login", action:"auth"
            }
            '*' { respond playerInstance, [status: CREATED] }
        }
    }

	@Secured(['permitAll'])
    def edit(Player playerInstance) {
        respond playerInstance
    }

	@Secured(['permitAll'])
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

	@Secured(['permitAll'])
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

	@Secured(['permitAll'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'player.label', default: 'Player'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	@Secured(['permitAll'])
	def enviarCodigo(Player instancePlayer) {
		mailService.sendMail {
			multipart true
			to instancePlayer.email
			subject "TORNEO MELI - Codigo de Confirmacion de Cuenta"			
			html g.render(template:'/mail/template', model:[instancePlayer:instancePlayer])
			inline 'springsourceInlineImage', 'image/jpg', new File('./web-app/images/baner_torneo.png')
		}
	
		log.info "Codigo de Confirmacion enviado correctamente: nicolas.genesio@gmail.com. Token: "+instancePlayer.confirmCode
	}
	
	@Transactional
	@Secured(['permitAll'])
	def confirm(String id){
//		log.info "Cuenta activada correctamente: "+instancePlayer.username
		session.invalidate()	
		Player instancePlayer = Player.findByConfirmCode(id)

		if(!instancePlayer){
			def mensaje = 'El usuario se encuentra desabilitado, Verifique su email para activar su cuenta o Solicite un nuevo Codigo'
			flash.params = [error:mensaje, nuevoCodigo:"si"]
			redirect action:"auth", controller:"login"
			return
		}

		if(instancePlayer.enabled){
			def mensaje = 'La cuenta ya se encuentra habilitada.'
			flash.params = [error:mensaje]
			redirect action:"auth", controller:"login"
			return
		}
		
		if(!instancePlayer.enabled){
			instancePlayer.enabled = true;
			instancePlayer.confirmCode = ""
			if (!instancePlayer.save(flush: true)) {
				def mensaje = 'Contactese con un administrador, error al Confirmar su cuenta.'
				flash.params = [error:mensaje]
				redirect action:"auth", controller:"login"
				return
			} else{
				def mensaje = 'Usuario Activado exitosamente.'
				flash.params = [info:mensaje]
				redirect action:"auth", controller:"login"
				return
			}
		}
	}
	
	@Secured(['permitAll'])
	def crearNuevoCodigo(){
		if(!flash.params){
			def mensaje = ""
			flash.params = [error:mensaje, info:mensaje]
		}
	}
	
	@Secured(['permitAll'])
	@Transactional
	def nuevoCodigo() {
		println "Busqueda de usuario con EMAIL"
		Player instancePlayer = Player.findByEmail(params.email)
		if(!instancePlayer){
			def mensaje = "El email ingresado se encuentra registrado."
			flash.params = [error:mensaje]
			redirect action:"auth", controller:"login"
			return
		} 
		if(!instancePlayer.enabled){
			instancePlayer.confirmCode = UUID.randomUUID().toString()
			if (!instancePlayer.save(flush: true)) {
				def mensaje = 'Contactese con un administrador, error al Confirmar su cuenta.'
				flash.params = [error:mensaje]
				redirect action:"auth", controller:"login"
				return
			} else {
				enviarCodigo(instancePlayer)
				def mensaje = 'Nuevo cofigo de confirmacion Enviado correctamente.'
				flash.params = [info:mensaje]
				redirect action:"auth", controller:"login"
				return
			}
		}else{
			def mensaje = 'El usuario ya se encuentra Activado no es necesario el codigo.'
			flash.params = [info:mensaje]
			redirect action:"auth", controller:"login"
			return
		}
	}
}
