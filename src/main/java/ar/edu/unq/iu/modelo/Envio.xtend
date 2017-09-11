package ar.edu.unq.iu.modelo

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Envio {
	protected double costo
	
	override equals(Object o) {
		this.class == o.class
	}
	
}

class Retirar extends Envio {

	new () {
		super()
		this.costo = 0.0
	}

}

@Accessors
class Delivery extends Envio {

	String direccion

	new (String direc) {
		super()
		this.costo = 15.0
		this.direccion = direc

	}
}