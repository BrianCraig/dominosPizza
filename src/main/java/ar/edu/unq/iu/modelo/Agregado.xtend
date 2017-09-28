package ar.edu.unq.iu.modelo

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Agregado {
	
	Ingrediente ingrediente
	Lado lado
	
	new(Ingrediente ingrediente, Lado cubre) {
		this.ingrediente = ingrediente
		this.lado = lado
	}

	def getPrecio() {
		this.ingrediente.precio
	}

	override equals(Object o) {
		this.class == o.class
	}
	
}

class Lado{}

class LadoIzquierdo extends Lado{
	override String toString(){
	   "Lado Izquierdo"
	}
}

class LadoDerecho extends Lado{
	override String toString(){
		"Lado Derecho"
	}
}

class LadoAmbos extends Lado{
	override String toString(){
		"Ambos Lados"
	}
}
