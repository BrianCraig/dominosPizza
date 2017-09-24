package ar.edu.unq.iu.repo

import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.unq.iu.modelo.Tamanio


class RepoTamanio extends CollectionBasedRepo<Tamanio> {
	

	
	override getEntityType() {
		typeof(Tamanio)
	}
	
	def create2(Tamanio t) {
		create(t)
		t
	}
	
	def getTamanio(Tamanio t) {
		allInstances.filter[tamanio |this.match(t, tamanio.nombre)].toList
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
	
	override protected getCriterio(Tamanio example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
	
	
	
}