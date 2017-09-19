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
	Pedido pedidoSeleccionado

	def cancelarPedido() {
		pedidoSeleccionado.estado = new Cancelado
	}
	
	def List<Pedido> getPedidosAbiertos(){
		repoPedido.getPedidosAbiertos()
	}
	
	def RepoPedido getRepoPedido() {
		ApplicationContext.instance.getSingleton(Pedido) as RepoPedido
	}
	
}