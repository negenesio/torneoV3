package com.torneo.fifa


class LoginTagLib {
	
    static defaultEncodeAs = [taglib:'text']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	def springSecurityService
	def loginControl = {
		out << "<fieldset class=\"buttons\" align=\"right\">"
		if(springSecurityService.getCurrentUser() != null){

		  out << "<strong>Bienvenido:</strong> ${springSecurityService.getCurrentUser().username} "
		  out << """${link(action:"index", controller:"logout"){"Cerrar Sesión"}}"""
		  out << " "
//		  out << """${link(action:"show", controller:"Usuario"){"Mi Perfil"}}"""
		}
		out << "</fieldset>"
	  }
}

