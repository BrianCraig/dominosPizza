package ar.edu.unq.iu.repo

import ar.edu.unq.iu.modelo.Pizza
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable

@Observable
class RepoPizza extends CollectionBasedRepo<Pizza> {
	
	override protected getCriterio(Pizza example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		new Pizza("Muzzarela", 75.0)
	}
	
	override getEntityType() {
		typeof(Pizza)
	}
	
	def getPizza(Pizza p) {
		allInstances.filter[pizza|this.match(p, pizza.nombre)].toList
	}
	
	def match(Object expectedValue, Object realValue) {
		if (expectedValue == null) {
			return true
		}
		if (realValue == null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}
	
}