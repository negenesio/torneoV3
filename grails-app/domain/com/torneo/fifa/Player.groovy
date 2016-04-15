package com.torneo.fifa

class Player extends User{
	
	String nombre
	String apellido
	String email
	Date fechaCreacion = new Date()
	Date fechaNacimiento = new Date()
	
    static constraints = {
    }
}
