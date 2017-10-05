package ar.edu.unq.iu.modelo

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import java.util.HashMap
import java.util.Map
import org.uqbar.commons.model.annotations.Dependencies

@TransactionalAndObservable
@Accessors
class Plato {

	Pizza pizza
	Tamanio tamanio
	Map<Ingrediente, Agregado> agregados = new HashMap()
	
	new(Pizza p, Tamanio tamanio) {
		this.pizza = p
		this.tamanio = tamanio
	}
	
	@Dependencies("agregados", "pizza", "tamanio")
	def getPrecio() {
		var p = pizza.precio * tamanio.precio
		for (a : agregados.values){
			p += a.getPrecio()
		}
		p
	}

	def agregarAgregado(Agregado a){
		agregados.put(a.ingrediente, a)
	}

	def quitarAgregado(Agregado a){
		agregados.remove(a.ingrediente)
	}

	def boolean contieneAgregadoDe(Ingrediente i){
		agregados.containsKey(i)
	}

	def Agregado agregadoDe(Ingrediente i){
		agregados.get(i)
	}
		
}
	
	
	
