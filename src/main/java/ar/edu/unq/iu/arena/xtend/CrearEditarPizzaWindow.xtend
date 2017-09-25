package ar.edu.unq.iu.arena.xtend

import org.uqbar.arena.aop.windows.TransactionalDialog
import ar.edu.unq.iu.modelo.Pizza
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.iu.modelo.Ingrediente
import ar.edu.unq.iu.repo.RepoIngrediente
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Button
import java.util.List
import org.uqbar.arena.bindings.ObservableProperty
import ar.edu.unq.iu.repo.RepoPizza

class CrearEditarPizzaWindow extends TransactionalDialog<Pizza> {
	
	new(WindowOwner owner, Pizza model) {
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
		val is = repoIngredientes.getAllIngredientes()

		/*
		for (ingrediente : is){
			new Label(panel).text = ingrediente.getNombre()
	
			new CheckBox(panel) => [
				enabled <=> [ Pizza p | p.agregarIngrediente(ingrediente) ]
				value <=> [ Pizza p | p.tieneIngrediente(ingrediente) ]
			]
		}*/
		new Label(panel).text = "Placeholder de el editor de sabores"
	}
	
	def getRepoIngredientes() {
		ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngrediente
	}

	def RepoPizza getRepoPizza() {
		ApplicationContext.instance.getSingleton(Pizza) as RepoPizza
	}

	override protected void addActions(Panel actions) {
		new Button(actions) => [
			caption = "Aceptar"
			onClick [|this.accept]
			setAsDefault
			disableOnError
		]

		new Button(actions) => [
			caption = "Cancelar"
			onClick [|
				this.cancel
			]
		]
	}

	override executeTask() {
		if (modelObject.isNew) {
			repoPizza.create(modelObject)
		} else {
			repoPizza.update(modelObject)
		}
		super.executeTask()
	}
}