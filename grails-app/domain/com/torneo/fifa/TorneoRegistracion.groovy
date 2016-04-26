package com.torneo.fifa

class TorneoRegistracion {

	Torneo torneo
	static hasMany = [players: Player]
	int cantidadRegistrados
	boolean enabled = false
	Date fechaCreacion = new Date()
	
    static constraints = {
    }
}
