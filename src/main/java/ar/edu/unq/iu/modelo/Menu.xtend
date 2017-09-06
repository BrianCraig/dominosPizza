package ar.edu.unq.iu.modelo

import java.util.List



class Menu {
	
	List<Pizza> pizzas
	List<Ingrediente> ingreExtras
	
	new (){
		pizzas = newArrayList()
		ingreExtras = newArrayList()
	}
	
	def agregarPizza (Pizza p) {
		pizzas.add(p)
	}
	
	def quitarPizza(Pizza p) {
		pizzas.remove(p)
	}
	
	def cantidadDePizzas() {
		pizzas.size()
	}
	
	def agregarIngredienteExtra(Ingrediente i) {
		ingreExtras.add(i)
	}
	
	def quitarIngredienteExtra(Ingrediente i) {
		ingreExtras.remove(i)
	}
	def tienePizza(Pizza p) {
		pizzas.contains(p)
	}
	
	def cantidadDeIngredientesExtras() {
		ingreExtras.size()
	}
	
	def tieneIngredienteExtra(Ingrediente i) {
		ingreExtras.contains(i)
	}
	
}