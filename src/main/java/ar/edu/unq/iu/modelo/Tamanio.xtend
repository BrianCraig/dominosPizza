package ar.edu.unq.iu.modelo

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity

@Accessors
abstract class Tamanio extends Entity {
	double precio
	String nombre

	override toString(){
		nombre
	}

	override equals(Object o) {
		this.class == o.class
	}
}

class TamanioPorcion extends Tamanio {
	new(){
		precio = 0.25
		nombre = "Porcion"
	}
}

class TamanioChica extends Tamanio {
	new(){
		precio = 0.5
		nombre = "Chica"
	}
}

class TamanioGrande extends Tamanio {
	new(){
		precio = 1
		nombre = "Grande"
	}
}

class TamanioFamiliar extends Tamanio{
	new(){
		precio = 1.25
		nombre = "Familiar"
	}
}