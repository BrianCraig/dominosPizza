package ar.edu.unq.iu.modelo

import java.util.ArrayList

class Plato {
	
	double precio
	
	Pizza pizza
	
	Object tamaño
	
	ArrayList<Ingrediente> ingrExtras
	
	new(Pizza p, Object tamaño, ArrayList<Ingrediente> extras) {
		this.pizza = p
		this.tamaño = tamaño
		this.ingrExtras = extras
		this.precio = this.calcularPrecio()
	}
	
	def calcularPrecio() {
		precio = pizza.getPrecioBase() * 1 //EL UNO REPRESENTA AL PRECIO DEL TAMAÑO POR AHORA 
		for (i : ingrExtras) {
			precio += i.getPrecio()
		}
		precio
	}
	
	def getPrecio() {
		this.precio
	}
	
}