package ar.edu.unq.iu.arena.xtend

import ar.edu.unq.iu.modelo.Ingrediente
import ar.edu.unq.iu.repo.RepoIngrediente
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.applicationContext.ApplicationContext

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class CrearEditarIngredienteWindow extends TransactionalDialog<Ingrediente> {
	
	new(WindowOwner owner, Ingrediente model) {
		super(owner, model)
		title = "Editar ingrediente"
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

	def getRepoIngredientes() {
		ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngrediente
	}

	override executeTask() {
		if (modelObject.isNew) {
			repoIngredientes.create(modelObject)
		} else {
			repoIngredientes.update(modelObject)
		}
		super.executeTask()
	}
}
