package ar.edu.unq.iu.appmodel

import ar.edu.unq.iu.modelo.Plato
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import java.util.List
import ar.edu.unq.iu.modelo.Pedido
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class PedidoAppModel {
	Plato platoSeleccionado
	
	
	List<Plato> platos
	
	
	new(List<Plato> ps) {
		platos = ps
	}
	
	def eliminarPlato() {
		platos.remove(platoSeleccionado)
	}
	
	

	
	
	
	
}