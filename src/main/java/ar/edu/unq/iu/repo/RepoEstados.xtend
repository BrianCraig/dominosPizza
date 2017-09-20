package ar.edu.unq.iu.repo

import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.unq.iu.modelo.EstadoPedido

class RepoEstados extends CollectionBasedRepo<EstadoPedido>{
	
	def create2(EstadoPedido e){
		this.create(e)
		return e
	}
	
	override protected getCriterio(EstadoPedido example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}