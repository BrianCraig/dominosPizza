package ar.edu.unq.iu.arena.xtend

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.iu.modelo.Plato
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.Label
import ar.edu.unq.iu.modelo.Pizza
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.iu.modelo.Tamanio
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.iu.modelo.Ingrediente
import ar.edu.unq.iu.repo.RepoIngrediente
import org.uqbar.arena.widgets.TextBox
import ar.edu.unq.iu.repo.RepoTamanio
import org.uqbar.arena.bindings.ObservableProperty
import ar.edu.unq.iu.repo.RepoPizza
import org.uqbar.arena.widgets.Button
import ar.edu.unq.iu.appmodel.PlatoAppModel
import org.uqbar.arena.bindings.PropertyAdapter

class AgregarEditarPlatoWindow extends TransactionalDialog<PlatoAppModel> {

	new(WindowOwner owner, Plato model) {
		super(owner, new PlatoAppModel(model))
		title = "Editar Plato"
	}

	override protected createFormPanel(Panel mainPanel) {

		val form = new Panel(mainPanel).layout = new ColumnLayout(2)

		new Label(form).text = "Pizza:"

		new Selector<Pizza>(form) => [
			allowNull(false)
			value <=> "plato.pizza"
			items <=> "repoPizza.objects"
		]

		new Label(form).text = "Tamaño:"

		new Selector<Tamanio>(form) => [
			allowNull(false)
			value <=> "plato.tamanio"
			items <=> "tamanios"
		]

		new Label(form).text = "Precio:"

		new Label(form) => [
			value <=> "plato.precio"
		]

		//this.mostrarIngredientes(mainPanel)


	}



	def mostrarIngredientes(Panel panel) {
		var is = repoIngrediente.getAllIngredientes()

		for (ingrediente : is) {
			new Label(panel).text = ingrediente.getNombre() // TODO: adapt
			new CheckBox(panel) => [
				enabled <=> [Pizza p|p.agregarIngrediente(ingrediente)]
				value <=> [Pizza p|p.tieneIngrediente(ingrediente)]
			]
		// TODO: poner los circulos de la distribucion de ingredientes 
		}

	}

	def getRepoIngrediente() {
		ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngrediente
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

}
