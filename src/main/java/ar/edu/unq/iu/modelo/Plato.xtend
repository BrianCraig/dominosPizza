package ar.edu.unq.iu.modelo

import java.util.ArrayList

class Plato {
	
	double precio
	
	Pizza pizza
	
	Tamanio tamanio
	
	ArrayList<Ingrediente> ingrExtras
	
	new(Pizza p, Tamanio tamanio, ArrayList<Ingrediente> extras) {
		this.pizza = p
		this.tamanio = tamanio
		this.ingrExtras = extras
		this.precio = this.calcularPrecio()
	}
	
	def calcularPrecio() {
		precio = pizza.getPrecioBase() * tamanio.getPrecio() //EL UNO REPRESENTA AL PRECIO DEL TAMA�O POR AHORA 
		for (i : ingrExtras) {
			precio += i.getPrecio()
		}
		precio
	}
	
	def getPrecio() {
		this.precio
	}
	
}