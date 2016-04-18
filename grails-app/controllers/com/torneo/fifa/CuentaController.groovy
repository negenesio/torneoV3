package com.torneo.fifa

import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import com.torneo.fifa.Player

class CuentaController {
	def mailService

	def index() { }


	//Solicita usuario y Email. envia los datos a : recuperarClave
	@Secured(['permitAll'])
	def inicioGenerarCodigoDesbloqueo(){
		if(!flash.params){
			def mensaje = ""
			flash.params = [error:mensaje, info:mensaje]
		}
	}

	//Verifica Usuario y Email ingresados, genera CODIGO DE DESBLOQUEO. Envia el Email con el CODIGO GENERADO.
	@Secured(['permitAll'])
	@Transactional
	def generarCodigoDesbloqueo(){
		//	def recuperarClave(){
		println "generarCodigoDesbloqueo()"
		Player instancePlayer = Player.findByEmail(params.email)
		if(!instancePlayer){
			println "El email no se encuentra registrado."
			def mensaje = "El E-MAIL no se encuentra registrado."
			flash.params = [error:mensaje]
			redirect action:"inicioGenerarCodigoDesbloqueo", controller:"cuenta"
			return
		}
		if(instancePlayer){
			println "El E-MAIL ingresado es correcto."
			char[] chars = "abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
			StringBuilder sb = new StringBuilder()
			Random random = new Random()
			for (int i = 0; i < 6; i++) {
				char c = chars[random.nextInt(chars.length)]
				sb.append(c)
			}
			String output = sb.toString();
			instancePlayer.codigoDesbloqueo = output
			instancePlayer.passwordExpired = true
			if(!instancePlayer.save(flush:true)){
				println "ERRO CRITICO no se pudo grabar."
				def mensaje = "Error en la configuracion de su cuenta. Comuniquese con un Administrador"					flash.params = [error:mensaje]
				redirect action:"auth", controller:"login"
				return
			}else{
				println "Se GRABO correctamente y se envio correctamente el email.."
				enviarNuevaCodigo(instancePlayer, output)
				def mensaje = "Nuevo Codigo de Cambio generado correctamente, Verifique su Email"
				flash.params = [info:mensaje, username:instancePlayer.username]
				redirect action:"confirmarCodigoDesbloqueo", controller:"cuenta"
				return
			}
		}
	}

	//Enviar email con CODIGO DE DESBLOQUEO para acceder al cambio de contraseña.
	@Secured(['permitAll'])
	def enviarNuevaCodigo(Player instancePlayer, String codigo){
		mailService.sendMail {
			multipart true
			to instancePlayer.email
			subject "TORNEO MELI - RECUPERAR PASSWORD"
			html g.render(template:'/mail/recuperarClave', model:[instancePlayer:instancePlayer, password:instancePlayer.password, codigo:codigo])
			inline 'springsourceInlineImage', 'image/jpg', new File('./web-app/images/baner_torneo.png')
		}
		println "ENVIANDO EMAIL CON CODIGO NUEVO"
	}

	//Vista donde solicita CODIGO DE DESBLOQUEO y usuario. (El codigo es enviado por email)
	@Secured(['permitAll'])
	def confirmarCodigoDesbloqueo(){
		if(!flash.params){
			def mensaje = ""
			flash.params = [error:mensaje, info:mensaje]
		}
	}

	@Secured(['permitAll'])
	def cambiarContraseña(){
		println "[CAMBIO DE CLAVE] - Buscar usuario"
		Player instancePlayer = Player.findByUsername(params.usuario)
		if(!instancePlayer){
			println "[CAMBIO DE CLAVE] - Usuario no encontrado"
			def mensaje = "Error en la configuracion de su cuenta. Comuniquese con un Administrador"
			flash.params = [error:mensaje]
			redirect action:"auth", controller:"login"
			return
		}
		if(instancePlayer){
			println "[CAMBIO DE CLAVE] - Usuario encontrado"
			if(!instancePlayer.passwordExpired){
				println "[CAMBIO DE CLAVE] - Password no expirado."
				def mensaje = "Su contraseña ya fue modificada."
				flash.params = [error:mensaje]
				redirect action:"auth", controller:"login"
				return
			}
			if(instancePlayer.passwordExpired){
				println "[CAMBIO DE CLAVE] - Password expirado."
				if(instancePlayer.codigoDesbloqueo == params.codigo){
					println "[CAMBIO DE CLAVE] - Codigo Ingresado Correcto"
					instancePlayer.passwordExpired = false
					instancePlayer.password = params.password
					instancePlayer.codigoDesbloqueo = ""
					println "[CAMBIO DE CLAVE] - Inicio GUARDADO"
					if(!instancePlayer.save(flush:true)){
						println "[CAMBIO DE CLAVE] - Guardado FALLO"
						def mensaje = "Error en la configuracion de su cuenta. Comuniquese con un Administrador"
						flash.params = [error:mensaje]
						redirect action:"auth", controller:"login"
						return
					}else{
						println "[CAMBIO DE CLAVE] - GUARDADO Exitoso!"
						def mensaje = "Contraseña actualizada correctamente."
						flash.params = [info:mensaje]
						redirect action:"auth", controller:"login"
						return
					}
				}else{
					println "[CAMBIO DE CLAVE] - Error con el Codigo de Desbloqueo"
					def mensaje = "Verifique el codigo de desbloqueo."
					flash.params = [info:mensaje, usuario:instancePlayer.username]
					redirect action:"confirmarCodigoDesbloqueo", controller:"cuenta"
					return
				}
			}
		}
	}
}
