package ar.edu.unq.iu.arena.xtend

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.eclipse.swt.layout.RowData
import ar.edu.unq.iu.appmodel.MenuAppModel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import ar.edu.unq.iu.modelo.Pizza
import ar.edu.unq.iu.modelo.Ingrediente
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.iu.repo.RepoPizza
import org.uqbar.arena.bindings.ObservableProperty
import ar.edu.unq.iu.repo.RepoIngrediente

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.windows.Dialog

class MenuWindow extends SimpleWindow<MenuAppModel>{
	
	new(WindowOwner parent) {
		super(parent, new MenuAppModel)
	}
	
	
	override def createMainTemplate(Panel mainPanel) {
		title = "DominosPizza - Menú"
		
		super.createMainTemplate(mainPanel)
		

		//this.createResultsGrid(mainPanel)
		//this.createGridActions(mainPanel)
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Salir"
			onClick([|this.close])
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		//val form = new Panel(mainPanel).layout = new ColumnLayout(2)
		val form = new Panel(mainPanel) => [
			layout = new ColumnLayout(4)
		]
		
		
		new Label(form).text = "Pizzas:"
		
		this.crearTablaPizzas(form)
		
		new Label(form).text = "Ingredientes Disponibles:"
		
		this.crearTablaIngredientes(form)
		
	}
	
	def crearTablaIngredientes(Panel panel) {
		val table = new Table<Ingrediente>(panel, typeof(Ingrediente)) => [
			items <=> "ingredientes"
			value <=> "ingredienteSeleccionado"
			numberVisibleRows = 5
		]
		
		val elementSelected = new NotNullObservable("pedidoSeleccionado")
		
		new Column<Ingrediente>(table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("nombre")
			
		]

		new Column<Ingrediente>(table) => [
			title = "Precio"
			fixedSize = 200
			bindContentsToProperty("precio")
			
		]
		
		this.crearAccionesIngrediente(panel)

		
	}
	
	def crearAccionesIngrediente(Panel panel) {
		val elementSelected = new NotNullObservable("ingredienteSeleccionado")
		
		val actionsPanel = new Panel(panel).layout = new VerticalLayout
		
		new Button(this) => [
			caption = "Crear"
			onClick([|this.crearIngrediente()])

		]

		new Button(this) => [
			caption = "Editar"
			onClick([|this.editarIngrediente()])
			bindEnabled(elementSelected)
		]

		new Button(this) => [
			caption = "Eliminar"
			onClick([|this.eliminarIngrediente()])
			bindEnabled(elementSelected)
		]
	}
	
	def editarIngrediente() {
		this.openDialog(new CrearEditarIngredienteWindow(this, modelObject.ingredienteSeleccionado))
	}
	
	def eliminarIngrediente() {
		modelObject.eliminarIngredienteSeleccionado()
	}
	
	def crearIngrediente() {
		this.openDialog(new CrearEditarIngredienteWindow(this, null))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject] // ??
		dialog.open

	}
	
	
	def getRepoIngrediente() {
		ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngrediente
	}
	
	def getRepoPizza() {
		ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizza
	}
	
	def crearTablaPizzas(Panel panel) {
		val table = new Table<Pizza>(panel, typeof(Pizza)) => [
			items <=> "pizzas"
			value <=> "pizzaSeleccionada"
			numberVisibleRows = 10
		]
		
		val elementSelected = new NotNullObservable("pizzaSeleccionada")
		
		new Column<Pizza>(table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("nombre")
		]

		new Column<Pizza>(table) => [
			title = "Precio"
			fixedSize = 200
			bindContentsToProperty("precio")
			
		]

		this.crearAccionesPizza(panel)
		
	}
	
	def crearAccionesPizza(Panel panel) {
		val elementSelected = new NotNullObservable("pizzaSeleccionada")
		
		val actionsPanel = new Panel(panel).layout = new VerticalLayout
		
		new Button(this) => [
			caption = "Crear"
			onClick([|this.crearPizza()])

		]

		new Button(this) => [
			caption = "Editar"
			onClick([|this.editarPizza()])
			bindEnabled(elementSelected)
		]

		new Button(this) => [
			caption = "Eliminar"
			onClick([|this.eliminarPizza()])
			bindEnabled(elementSelected)
		]
	}
	
	def crearPizza() {
		this.openDialog(new CrearEditarPizzaWindow(this, null))
	}
	
	def editarPizza() {
		this.openDialog(new CrearEditarPizzaWindow(this, modelObject.pizzaSeleccionada))
	}
	
	def eliminarPizza() {
		modelObject.eliminarPizzaSeleccionada()
	}
	
}