package com.torneo.fifa

class Torneo {
	
	transient springSecurityService

	String nombre
	String descripcion
	Date fechaCreacion = new Date()
	int cantidadPlayer
	String password
	Player owner
	
	def beforeInsert() {
		encodePassword()
	}
	
	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
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
