package ar.edu.unq.iu.appmodel

import ar.edu.unq.iu.modelo.Plato
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import java.util.List
import ar.edu.unq.iu.modelo.Pedido
import org.uqbar.commons.model.annotations.Observable
import java.io.Serializable
import ar.edu.unq.iu.repo.RepoPizza
import ar.edu.unq.iu.modelo.Pizza

@Observable
@Accessors
class PedidoAppModel implements Serializable {
	Plato platoSeleccionado
	Pedido pedido
	
	new(Pedido pedido) {
		this.pedido = pedido
	}
	
	def eliminarPlato() {
		pedido.platos.remove(platoSeleccionado)
	}


	def getRepoPizza() {
		ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizza
	}
}