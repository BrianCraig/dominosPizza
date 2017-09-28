package ar.edu.unq.iu.modelo

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
class Plato {
	
	
	Pizza pizza
	Tamanio tamanio
	List<Agregado> agregados = new ArrayList()
	
	new(Pizza p, Tamanio tamanio) {
		this.pizza = p
		this.tamanio = tamanio
	}
	
	def getPrecio() {
		var p = pizza.precio * tamanio.precio
		for (a : agregados){
			p += a.getPrecio()
		}
		p
	}
		
	}
	
	
	
