package ar.edu.unq.iu.arena.xtend

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.iu.modelo.Pedido
import org.uqbar.arena.windows.SimpleWindow
import ar.edu.unq.iu.appmodel.ListadoDePedidos

class ListadoDePedidosCerrados extends SimpleWindow<ListadoDePedidos>{
	
	new(WindowOwner parent) {
		super(parent, new ListadoDePedidos)
	}
	
	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
	
}