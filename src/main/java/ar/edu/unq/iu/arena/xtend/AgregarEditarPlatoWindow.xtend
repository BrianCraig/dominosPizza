package ar.edu.unq.iu.arena.xtend

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.iu.modelo.Plato
import org.uqbar.arena.widgets.Panel

class AgregarEditarPlatoWindow extends TransactionalDialog<Plato> {
	
	new(WindowOwner owner, Plato model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}