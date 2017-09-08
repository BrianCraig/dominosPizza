package ar.edu.unq.iu.modelo

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente {
	String nombre
	Double precio
	
	new (String n, Double p){
		this.nombre = n
		this.precio = p
	}
}