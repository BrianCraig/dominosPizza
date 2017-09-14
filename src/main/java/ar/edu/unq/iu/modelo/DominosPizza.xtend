package ar.edu.unq.iu.modelo

import java.util.Observer
import java.util.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class DominosPizza implements Observer {
	
	Menu menu
	List<Cliente> clientes
	List<Pedido> pedidos
	
	new (Menu menu){
		this.menu = menu
		this.clientes = newArrayList()
		this.pedidos = newArrayList()
	}

	def agregarPedido(Pedido p){
		pedidos.add(p)
	}

	def quitarPedido(Pedido p){
		pedidos.remove(p)
	}
	
	override update(Observable o, Object arg) {
		var pedido = o as Pedido  
		if(arg == "Su pedido esta en viaje"){
			this.mandarMail(pedido.getCliente(), "Su pedido esta en viaje")
		}
		else{
			this.mandarMail(pedido.getCliente(), "Sepa disculpar la demora en la entrega de su pedido. Saluda atte. Domino's Pizza")
		}
	}
	
	def mandarMail(Cliente cliente, String string) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
	
}