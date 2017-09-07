package ar.edu.unq.iu.modelo

class Cliente {
	String nombre
	String nick
	String password
	String mail
	String direccion
	List<Pedidos> pedidos
	
	def Cliente (nombre, nick, password, mail, direccion){
		this.nombre = nombre
		this.nick = nick
		this.password = password
		this.mail = mail
		this.direccion = direccion
	}
	
	def agregarPedido(pedido){
		pedidos.add(pedido)
	}
}