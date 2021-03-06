package com.torneo.fifa

class Torneo {
	
	transient springSecurityService

	String nombre
	String descripcion
	Date fechaCreacion = new Date()
	int cantidadPlayer
	String password
	Player owner
	boolean publicado = false
	
	def beforeInsert() {
		if(password != null){
			encodePassword()
		}
		
	}
	
	def beforeUpdate() {
		if(password != null){
			if (isDirty('password')) {
				encodePassword()
			}
		}		
	}
	
	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
	
    static constraints = {
		password blank: true, nullable:true
    }
	
	static transients = ['springSecurityService']
}
