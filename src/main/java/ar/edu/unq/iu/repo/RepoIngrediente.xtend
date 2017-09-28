package ar.edu.unq.iu.repo

import ar.edu.unq.iu.modelo.Ingrediente
import org.uqbar.commons.model.CollectionBasedRepo

class RepoIngrediente extends CollectionBasedRepo<Ingrediente>{
	
	def create(String pNombre, double valor) {
		val i = new Ingrediente(pNombre, valor)
		this.create(i)
		return i		
	}
	
	override protected getCriterio(Ingrediente arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getEntityType() {
		Ingrediente
	}
	
	def getAllIngredientes() {
		allInstances
	}
	
}