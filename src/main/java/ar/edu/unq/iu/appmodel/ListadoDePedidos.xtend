package ar.edu.unq.iu.appmodel

import ar.edu.unq.iu.modelo.Cancelado
import ar.edu.unq.iu.modelo.Pedido
import ar.edu.unq.iu.repo.RepoPedido
import java.io.Serializable
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils

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
	
	def getPedidosCerrados() {
		repoPedido.getPedidosCerrados()
	}

	def actualizar(){
		ObservableUtils.firePropertyChanged(this, "pedidosAbiertos")
	}
	
}