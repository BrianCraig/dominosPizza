package ar.edu.unq.iu.modelo

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
abstract class Envio {
	protected double costo
	
	override equals(Object o) {
		this.class == o.class
	}

	def getPosiblesEstados(){
		#[]
	}
	
}

class Retirar extends Envio {

	new () {
		super()
		this.costo = 0.0
	}

	override getPosiblesEstados(){
		#[new Preparando, new ListoParaRetirar, new Entregado, new Cancelado]
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

	override getPosiblesEstados(){
		#[new Preparando, new ListoParaEnviar, new EnViaje, new Entregado, new Cancelado]
	}
}