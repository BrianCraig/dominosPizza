package ar.edu.unq.iu.modelo

import java.util.ArrayList

class Plato {
	
	double precio
	
	Pizza pizza
	
	TipoTamanio tamanio
	
	ArrayList<Ingrediente> ingrExtras
	
	new(Pizza p, TipoTamanio tamanio, ArrayList<Ingrediente> extras) {
		this.pizza = p
		this.tamanio = tamanio
		this.ingrExtras = extras
		this.precio = this.calcularPrecio()
	}
	
	def calcularPrecio() {
		precio = pizza.getPrecioBase() * tamanio.getPrecio //EL UNO REPRESENTA AL PRECIO DEL TAMAÑO POR AHORA 
		for (i : ingrExtras) {
			precio += i.getPrecio()
		}
		precio
	}
	
	def getPrecio() {
		this.precio
	}
	
}