package ar.edu.unq.iu.modelo

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
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
	
}

class Lado{}

class LadoIzquierdo extends Lado{}

class LadoDerecho extends Lado{}

class LadoAmbos extends Lado{}
