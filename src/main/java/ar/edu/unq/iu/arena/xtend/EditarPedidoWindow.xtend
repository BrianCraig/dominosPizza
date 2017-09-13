package ar.edu.unq.iu.arena.xtend

import ar.edu.unq.iu.modelo.Pedido
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel

class EditarPedidoWindow extends TransactionalDialog<Pedido> {
	
	new(WindowOwner owner, Pedido pedido) {
		super(owner, pedido)
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
	
}