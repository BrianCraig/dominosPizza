package ar.edu.unq.iu.modelo

import java.util.List

class Menu {
	
	List<Promocion> promos
	List<Ingrediente> ingreExtras
	
	new (){
		promos = newArrayList()
		ingreExtras = newArrayList()
	}
	
	def agregarPromo(Promocion promo) {
		promos.add(promo)
	}
	
	def quitarPromo(Promocion promo) {
		promos.remove(promo)
	}
	
	def cantidadDePromos() {
		promos.size()
	}
	
	def agregarIngredienteExtra(Ingrediente i) {
		ingreExtras.add(i)
	}
	
	def quitarIngredienteExtra(Ingrediente i) {
		ingreExtras.remove(i)
	}
	def tienePromo(Promocion promocion) {
		promos.contains(promocion)
	}
	
	def cantidadDeIngredientesExtras() {
		ingreExtras.size()
	}
	
	def tieneIngredienteExtra(Ingrediente i) {
		ingreExtras.contains(i)
	}
	
}