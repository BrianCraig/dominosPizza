package ar.edu.unq.iu.modelo

import ar.edu.unq.iu.modelo.TipoEnvio

class Delivery extends TipoEnvio {
	
	String direccion
	
	new (String direc) {
		super()
		this.costo = 15.0
		this.direccion = direc
		
	}

}