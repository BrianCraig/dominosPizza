package ar.edu.unq.iu.modelo

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Plato {
	
	double precio
	Pizza pizza
	Tamanio tamanio
	List<Agregado> agregados = new ArrayList()
	
	new(Pizza p, Tamanio tamanio) {
		this.pizza = p
		this.tamanio = tamanio
	}
	
	def getPrecio() {
		var total = pizza.precio * tamanio.getPrecio() //EL UNO REPRESENTA AL PRECIO DEL TAMA�O POR AHORA
		for (i : agregados) {
			total += i.getPrecio()
		}
		total
	}
	
}