package com.torneo.fifa


class LoginTagLib {
	
    static defaultEncodeAs = [taglib:'text']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	def springSecurityService
	def loginControl = {
		out << "<fieldset class=\"buttons\" align=\"right\">"
		if(springSecurityService.getCurrentUser() != null){

		  out << "<strong>Bienvenido:</strong> <u>${link(action:"edit", controller:"Player", id:"${springSecurityService.getCurrentUser().id}"){springSecurityService.getCurrentUser().username}}</u>"
		  out << """${link(action:"index", controller:"logout"){"Cerrar Sesión"}}"""
		  out << " "
		}
		out << "</fieldset>"
	  }
}

