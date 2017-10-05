package ar.edu.unq.iu.modelo

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
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
	
	def quitarIngredientePizza(Pizza pizza, Ingrediente ingrediente) {
		for(p: pizzas){
			if (p == pizza){
				p.quitarIngrediente(ingrediente)
			}
		}
	}
	
	def agregarIngredientePizza(Pizza pizza, Ingrediente ingrediente) {
		for(p: pizzas){
			if (p == pizza){
				p.agregarIngrediente(ingrediente)
			}
		}
	}
	
	def cambiarNombrePizza(Pizza pizza, String string) {
		for(p: pizzas){
			if (p == pizza){
				p.nombre = string
			}
		}
	}
	
	def cambiarPrecioPizza(Pizza pizza, double d) {
		for(p: pizzas){
			if (p == pizza){
				p.precio = d
			}
		}
	}
	
	def cambiarNombreIngrediente(Ingrediente ingrediente, String string) {
		for(i: ingreExtras){
			if (i == ingrediente){
				i.nombre = string
			}
		}
	}
	
	def cambiarPrecioIngrediente(Ingrediente ingrediente, double d) {
		for(i: ingreExtras){
			if (i == ingrediente){
				i.precio = d
			}
		}
	}
	
}