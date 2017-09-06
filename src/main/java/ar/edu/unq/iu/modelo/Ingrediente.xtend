package ar.edu.unq.iu.modelo

class Ingrediente {
	
	String nombre
	
	Double precio
	
	new (String n, Double p){
		this.nombre = n
		this.precio = p
	}
	
	def getPrecio() {
		this.precio
	}
	
}