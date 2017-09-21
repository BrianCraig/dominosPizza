package ar.edu.unq.iu.modelo

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
class Ingrediente extends Entity{
	String nombre
	Double precio
	
	new (String n, Double p){
		this.nombre = n
		this.precio = p
	}
}