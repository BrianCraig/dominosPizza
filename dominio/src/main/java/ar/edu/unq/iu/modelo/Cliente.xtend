package ar.edu.unq.iu.modelo

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Cliente extends Entity {
	String nombre
	String nick
	String password
	String mail
	String direccion
	List<Pedido> pedidos
	
	new(String nombre, String  nick, String password, String mail, String direccion){
		this.nombre = nombre
		this.nick = nick
		this.password = password
		this.mail = mail
		this.direccion = direccion
		this.pedidos = newArrayList()
	}
	
	def agregarPedido(Pedido pedido){
		pedidos.add(pedido)
	}
	
	
}