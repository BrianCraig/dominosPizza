package ar.edu.unq.iu.arena.xtend

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.iu.appmodel.MenuAppModel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import ar.edu.unq.iu.modelo.Pizza
import ar.edu.unq.iu.modelo.Ingrediente
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.iu.repo.RepoPizza
import ar.edu.unq.iu.repo.RepoIngrediente
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.windows.Dialog

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*


class MenuWindow extends SimpleWindow<MenuAppModel>{
	
	new(WindowOwner parent) {
		super(parent, new MenuAppModel)
	}
	
	
	override def createMainTemplate(Panel mainPanel) {
		title = "DominosPizza - Menú"
		super.createMainTemplate(mainPanel)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.crearLayoutPizzas(mainPanel)
        this.crearLayoutIngredientes(mainPanel)
	}

    override protected addActions(Panel actionsPanel) {
        new Button(actionsPanel) => [
            caption = "Salir"
            onClick([|this.close])
        ]
    }

    /* Pizzas */

    def crearLayoutPizzas(Panel parent) {
        new Label(parent) => [
            text = "Pizzas:"
            alignLeft
            fontSize = 12
        ]

        val sub = new Panel(parent) => [
            layout = new HorizontalLayout()
        ]

        this.crearTablaPizzas(sub)
        this.crearAccionesPizza(sub)
    }

    def crearTablaPizzas(Panel panel) {
        val table = new Table<Pizza>(panel, typeof(Pizza)) => [
            items <=> "pizzas"
            value <=> "pizzaSeleccionada"
            numberVisibleRows = 4
        ]

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
    }

    def crearAccionesPizza(Panel panel) {
        val elementSelected = new NotNullObservable("pizzaSeleccionada")

        val actionsPanel = new Panel(panel).layout = new VerticalLayout

        new Button(actionsPanel) => [
            caption = "Crear"
            onClick([|this.crearPizza()])

        ]

        new Button(actionsPanel) => [
            caption = "Editar"
            onClick([|this.editarPizza()])
            bindEnabled(elementSelected)
        ]

        new Button(actionsPanel) => [
            caption = "Eliminar"
            onClick([|this.eliminarPizza()])
            bindEnabled(elementSelected)
        ]
    }

    def crearPizza() {
        this.openDialog(new CrearEditarPizzaWindow(this, new Pizza("", 0.0)))
    }

    def editarPizza() {
        this.openDialog(new CrearEditarPizzaWindow(this, modelObject.pizzaSeleccionada))
    }

    def eliminarPizza() {
        modelObject.eliminarPizzaSeleccionada()
        modelObject.actualizar
    }

    /* Ingredientes */

    def crearLayoutIngredientes(Panel parent) {
        new Label(parent) => [
            text = "Ingredientes:"
            alignLeft
            fontSize = 12
        ]

        val sub = new Panel(parent) => [
            layout = new HorizontalLayout()
        ]

        this.crearTablaIngredientes(sub)
        this.crearAccionesIngrediente(sub)
    }
	
	def crearTablaIngredientes(Panel panel) {
		val table = new Table<Ingrediente>(panel, typeof(Ingrediente)) => [
			items <=> "ingredientes"
			value <=> "ingredienteSeleccionado"
			numberVisibleRows = 5
		]

		
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
	}
	
	def crearAccionesIngrediente(Panel panel) {
		val elementSelected = new NotNullObservable("ingredienteSeleccionado")
		
		val actionsPanel = new Panel(panel).layout = new VerticalLayout
		
		new Button(actionsPanel) => [
			caption = "Crear"
			onClick([|this.crearIngrediente()])
		]

		new Button(actionsPanel) => [
			caption = "Editar"
			onClick([|this.editarIngrediente()])
			bindEnabled(elementSelected)
		]

		new Button(actionsPanel) => [
			caption = "Eliminar"
			onClick([|this.eliminarIngrediente()])
			bindEnabled(elementSelected)
		]
	}

    def crearIngrediente() {
        this.openDialog(new CrearEditarIngredienteWindow(this, new Ingrediente("", 0.0)))
    }

    def editarIngrediente() {
        this.openDialog(new CrearEditarIngredienteWindow(this, modelObject.ingredienteSeleccionado))
    }

    def eliminarIngrediente() {
        modelObject.eliminarIngredienteSeleccionado()
        modelObject.actualizar
    }

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.actualizar]
		dialog.open
	}
}