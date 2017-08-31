package ar.edu.unq.iu.modelo

class Agregado {
	
	Ingrediente ingrediente
	Cubre cubre
	
	new(Ingrediente ingrediente, Cubre cubre) {
		this.ingrediente = ingrediente
		this.cubre = cubre
	}
	
}

enum Cubre{
	Izquierda,
	Derecha,
	Todo
}
