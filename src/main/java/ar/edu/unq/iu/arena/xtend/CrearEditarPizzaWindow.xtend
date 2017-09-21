package ar.edu.unq.iu.arena.xtend

import org.uqbar.arena.aop.windows.TransactionalDialog
import ar.edu.unq.iu.modelo.Pizza
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.iu.appmodel.PizzaAppModel
import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.iu.modelo.Ingrediente
import ar.edu.unq.iu.repo.RepoIngrediente
import org.uqbar.arena.widgets.CheckBox

class CrearEditarPizzaWindow extends TransactionalDialog<PizzaAppModel> {
	
	new(WindowOwner owner, PizzaAppModel model) {
		super(owner, model)
		title = "Editar Pizza"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel).layout = new ColumnLayout(2)
		
		new Label(form).text = "Nombre:"

		new TextBox(form) => [
			value <=> "nombre"
			width = 200
		]
	
		new Label(form).text = "Precio:"

		new TextBox(form) => [
			value <=> "precio"
			width = 200
		]
		
		this.mostrarIngredientes(mainPanel)
	}
	
	def mostrarIngredientes(Panel panel) {
		var is = repoIngrediente.getAllIngredientes()
		
		for (ingrediente : is){
			new Label(panel).text = ingrediente.getNombre() //TODO: adapt
	
		new CheckBox(panel) => [
			enabled <=> [ Pizza p | p.agregarIngrediente(ingrediente) ]
			value <=> [ Pizza p | p.tieneIngrediente(ingrediente) ]
		]	
			//TODO: poner los circulos de la distribucion de ingredientes
		}
	}
	
	def getRepoIngrediente() {
		ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngrediente
	}
	
}