package ar.edu.unq.iu.appmodel

import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.eclipse.xtend.lib.annotations.Accessors
import java.io.Serializable
import ar.edu.unq.iu.modelo.Pizza
import ar.edu.unq.iu.modelo.Ingrediente

@TransactionalAndObservable
@Accessors
class PizzaIngredientesModel implements Serializable {

	Pizza pizza
	Ingrediente ingrediente
	
	new(Pizza pizza, Ingrediente ingrediente) {
        this.pizza = pizza
        this.ingrediente = ingrediente
    }
    
    def Boolean getContieneIngrediente(){
		pizza.tieneIngrediente(ingrediente)
	}

	def void setContieneIngrediente(Boolean agregar){
		if(agregar){
			pizza.agregarIngrediente(ingrediente)
		} else {
			pizza.quitarIngrediente(ingrediente)
		}
	}
}