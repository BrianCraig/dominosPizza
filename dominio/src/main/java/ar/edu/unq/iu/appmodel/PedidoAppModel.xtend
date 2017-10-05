package ar.edu.unq.iu.appmodel

import ar.edu.unq.iu.modelo.Pedido
import ar.edu.unq.iu.modelo.Pizza
import ar.edu.unq.iu.modelo.Plato
import ar.edu.unq.iu.repo.RepoPizza
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.iu.modelo.TamanioGrande

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

	def getNuevoPlato() {
		new Plato(repoPizza.objects.get(0), new TamanioGrande)
	}

	def getRepoPizza() {
		ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizza
	}
}
