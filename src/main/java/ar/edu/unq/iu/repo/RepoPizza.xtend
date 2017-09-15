package ar.edu.unq.iu.repo

import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.unq.iu.modelo.Pizza

class RepoPizza extends CollectionBasedRepo<Pizza> {
	
	override protected getCriterio(Pizza example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}