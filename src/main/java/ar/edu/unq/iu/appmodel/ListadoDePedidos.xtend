package ar.edu.unq.iu.appmodel

import java.util.List
import ar.edu.unq.iu.modelo.Pedido
import java.io.Serializable
import ar.edu.unq.iu.modelo.Cancelado
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.iu.repo.RepoPedido
import org.uqbar.commons.applicationContext.ApplicationContext

@Observable
@Accessors
class ListadoDePedidos implements Serializable {
	
	List<Pedido> pedidos
	Pedido pedidoSeleccionado
	
	new(){
		pedidos = this.getPedidosAbiertos()
		pedidoSeleccionado = null
	}
	
	def cancelarPedido() {
		pedidoSeleccionado.estado = new Cancelado
	}
	
	def List<Pedido> getPedidosAbiertos(){
		val repo = this.getRepoPedido()
		repo.getPedidosAbiertos()
	}
	
	def RepoPedido getRepoPedido() {
		ApplicationContext.instance.getSingleton(typeof(Pedido))
	}
	
}