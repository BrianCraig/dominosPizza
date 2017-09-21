package ar.edu.unq.iu.modelo

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
class Pizza extends Entity{
	String nombre
	List<Ingrediente> ingredientes = new ArrayList()
	double precio
	
	new (String n, double p) {
		this.nombre = n
		this.precio = p
	}
	
	def quitarIngrediente(Ingrediente ingrediente) {
		ingredientes.remove(ingrediente)
	}
	
	def agregarIngrediente(Ingrediente ingrediente) {
		ingredientes.add(ingrediente)
	}
	
	def getPrecio(){
		precio
	}
	
	def tieneIngrediente(Ingrediente i) {
		ingredientes.contains(i)
	}
	
}