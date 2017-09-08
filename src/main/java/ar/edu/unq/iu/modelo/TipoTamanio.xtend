package ar.edu.unq.iu.modelo

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Tamanio {
	double precio
}

class TamanioPorcion extends Tamanio {
	new(){
		precio = 0.25
	}
}

class TamanioChica extends Tamanio {
	new(){
		precio = 0.5
	}
}

class TamanioGrande extends Tamanio {
	new(){
		precio = 1
	}
}

class TamanioFamiliar extends Tamanio{
	new(){
		precio = 1.25
	}
}