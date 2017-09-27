package ar.edu.unq.iu.arena.xtend

import org.uqbar.arena.aop.windows.TransactionalDialog
import ar.edu.unq.iu.modelo.Pizza
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.iu.modelo.Ingrediente
import ar.edu.unq.iu.repo.RepoIngrediente
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Button
import java.util.List
import ar.edu.unq.iu.repo.RepoPizza
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.bindings.ValueTransformer

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.common.transaction.Collection.TransacionalList

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
		for (ingrediente : repoIngredientes.getAllIngredientes()){

			val selector = new Panel(panel).layout = new HorizontalLayout()

			new CheckBox(selector) => [
				bindValueToProperty("ingredientes").setTransformer(new ContainsTransformer<Ingrediente>(ingrediente));
			]
			new Label(selector).text = ingrediente.getNombre()
		}
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

class ContainsTransformer<T> implements ValueTransformer<TransacionalList<T>, Boolean> {
	TransacionalList<T> list
	T model

	new(T model) {
		this.model = model
	}

	override TransacionalList<T> viewToModel(Boolean onList) {
		if(onList){
			list.add(model)
		} else {
			list.remove(model)
		}
		list
	}

	override Boolean modelToView(TransacionalList<T> list) {
		this.list = list
		list.contains(model)
	}

	override Class getModelType() {
		List
	}

	override Class<Boolean> getViewType() {
		Boolean
	}
}
