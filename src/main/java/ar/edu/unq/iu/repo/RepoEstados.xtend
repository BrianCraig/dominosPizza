package ar.edu.unq.iu.repo

import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.unq.iu.modelo.EstadoPedido
import ar.edu.unq.iu.modelo.Preparando
import org.uqbar.commons.model.annotations.Observable

@Observable
class RepoEstados extends CollectionBasedRepo<EstadoPedido> {

	def create2(EstadoPedido e) {
		this.create(e)
		return e
	}

	def estados() {
		allInstances
	}

	override protected getCriterio(EstadoPedido example) {
		null
	}

	override createExample() {
		new Preparando
	}

	override getEntityType() {
		typeof(EstadoPedido)
	}

}
