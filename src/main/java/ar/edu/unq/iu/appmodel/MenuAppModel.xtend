package ar.edu.unq.iu.appmodel

import ar.edu.unq.iu.repo.RepoPizza
import ar.edu.unq.iu.modelo.Pizza
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.io.Serializable
import java.util.List
import ar.edu.unq.iu.repo.RepoIngrediente
import ar.edu.unq.iu.modelo.Ingrediente
import org.uqbar.commons.model.utils.ObservableUtils

@Observable
@Accessors
class MenuAppModel implements Serializable {
	
	
	Pizza pizzaSeleccionada
	Ingrediente ingredienteSeleccionado

    def List<Pizza> getPizzas() {
        repoPizza.objects
    }

    def List<Ingrediente> getIngredientes() {
        repoIngrediente.objects
    }

    def RepoPizza getRepoPizza() {
        ApplicationContext.instance.getSingleton(Pizza) as RepoPizza
    }

    def RepoIngrediente getRepoIngrediente() {
        ApplicationContext.instance.getSingleton(Ingrediente) as RepoIngrediente
    }
	
	def eliminarIngredienteSeleccionado() {
		getRepoIngrediente().delete(ingredienteSeleccionado)
		ingredienteSeleccionado = null
	}
	
	def eliminarPizzaSeleccionada() {
		getRepoPizza().delete(pizzaSeleccionada)
		pizzaSeleccionada = null
	}

    def actualizar(){
        ObservableUtils.firePropertyChanged(this, "pizzas", this.repoPizza)
        ObservableUtils.firePropertyChanged(this, "ingredientes", this.repoPizza)
    }

}