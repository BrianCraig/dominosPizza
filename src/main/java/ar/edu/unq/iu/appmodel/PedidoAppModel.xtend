package ar.edu.unq.iu.appmodel

import ar.edu.unq.iu.modelo.Plato
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import java.util.List
import ar.edu.unq.iu.modelo.Pedido

@Accessors
class PedidoAppModel {
	Plato platoSeleccionado
	Pedido pedido
	
	List<Plato> platos
	
	new(Pedido pedido, List<Plato> ps){
		platos = ps
	}
	
	def eliminarPlato() {
		platos.remove(platoSeleccionado)
	}
	

	
	
	
	
}