package ar.edu.unq.iu.modelo

import java.util.ArrayList

class Pizza {
	String nombre
	
	ArrayList<Ingrediente> ingredientes
	
	double precioBase
	
	new (String n, double p, ArrayList<Ingrediente> is) {
		this.nombre = n
		this.precioBase = p
		this.ingredientes = is
	}
	
	def getPrecioBase() {
		this.precioBase
	}
	
}