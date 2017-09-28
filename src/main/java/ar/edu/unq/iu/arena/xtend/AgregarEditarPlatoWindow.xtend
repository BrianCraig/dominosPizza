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

class AgregarEditarPlatoWindow extends TransactionalDialog<Plato> {

	new(WindowOwner owner, Plato model) {
		super(owner, model)
		title = "Editar Plato"
	}

	override protected createFormPanel(Panel mainPanel) {

		val form = new Panel(mainPanel).layout = new ColumnLayout(3)

		new Label(form).text = "Pizza:"

		new Selector<Pizza>(form) => [
			allowNull(false)
			value <=> "pizza"
			val pizza = bindItems(new ObservableProperty(repoPizza.getPizza(modelObject.pizza), "pizza"))
			pizza.adaptWith(typeof(Pizza), "nombre" + "precio")

		]

		new Label(form).text = "Tamaño:"

		new Selector<Tamanio>(form) => [
			allowNull(false)
			value <=> "tamaño"
			val tamaño = bindItems(new ObservableProperty(repoTamanio.getTamanio(modelObject.tamanio), "tamaño"))
			tamaño.adaptWith(typeof(Tamanio), "nombre")

		]

		this.mostrarIngredientes(mainPanel)

		new Label(form).text = "Precio:"

		new TextBox(form) => [
			value <=> "precio"
			width = 200
		]

	}

	def getRepoPizza() {
		ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizza
	}

	def getRepoTamanio() {
		ApplicationContext.instance.getSingleton(typeof(Tamanio)) as RepoTamanio
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
