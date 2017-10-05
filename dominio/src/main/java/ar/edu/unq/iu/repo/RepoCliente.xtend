package ar.edu.unq.iu.repo

import ar.edu.unq.iu.modelo.Cliente
import org.uqbar.commons.model.CollectionBasedRepo

class RepoCliente extends CollectionBasedRepo<Cliente> {
	
	def create(String nombre, String  nick, String password, String mail, String direccion) {
		val c = new Cliente(nombre, nick, password, mail, direccion)
		this.create(c)
		return c		
	}
	
	override protected getCriterio(Cliente example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}