package ar.edu.unq.iu.arena.xtend

import ar.edu.unq.iu.appmodel.MenuAppModel
import ar.edu.unq.iu.modelo.Ingrediente
import ar.edu.unq.iu.modelo.Pizza
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.model.CollectionBasedRepo

class MenuWindow extends SimpleWindow<MenuAppModel>{
	
	new(WindowOwner parent) {
		super(parent, new MenuAppModel)
	}

	override def createMainTemplate(Panel mainPanel) {
		title = "DominosPizza - Menú"
		super.createMainTemplate(mainPanel)
	}
	
	override protected createFormPanel(Panel mainPanel) {
        new CrearEditarPizza(mainPanel, modelObject.repoPizza, this)
        new CrearEditarIngrediente(mainPanel, modelObject.repoIngrediente, this)
	}

    override protected addActions(Panel actionsPanel) {
        new Button(actionsPanel) => [
            caption = "Salir"
            onClick([|this.close])
        ]
    }
}

class CrearEditarPizza extends CrearEditarPanel<Pizza> {
    WindowOwner window

    new(Panel parent,CollectionBasedRepo repo, WindowOwner win){
        super(parent, repo)
        this.window = win
        this.titulo = "Pizzas:"
        this.modificaciones()
    }

    def modificaciones() {
        new Column<Pizza>(this.tabla) => [
            title = "Nombre"
            fixedSize = 200
            bindContentsToProperty("nombre")
        ]

        new Column<Pizza>(this.tabla) => [
            title = "Precio"
            fixedSize = 200
            bindContentsToProperty("precio")
        ]
    }

    override crear() {
        this.openDialog(new CrearEditarPizzaWindow(window, new Pizza("", 0.0)))
    }

    override editar(Pizza modelo) {
        this.openDialog(new CrearEditarPizzaWindow(window, modelo))
    }

    def openDialog(Dialog<?> dialog) {
        dialog.onAccept[|modelObject.actualizar]
        dialog.open
    }
}

class CrearEditarIngrediente extends CrearEditarPanel<Ingrediente> {
    WindowOwner window

    new(Panel parent,CollectionBasedRepo repo, WindowOwner win){
        super(parent, repo)
        this.window = win
        this.titulo = "Ingredientes:"
        this.modificaciones()
    }

    def modificaciones() {
        new Column<Ingrediente>(this.tabla) => [
            title = "Nombre"
            fixedSize = 200
            bindContentsToProperty("nombre")
        ]

        new Column<Ingrediente>(this.tabla) => [
            title = "Precio"
            fixedSize = 200
            bindContentsToProperty("precio")
        ]
    }

    override crear() {
        this.openDialog(new CrearEditarIngredienteWindow(window, new Ingrediente("", 0.0)))
    }

    override editar(Ingrediente modelo) {
        this.openDialog(new CrearEditarIngredienteWindow(window, modelo))
    }

    def openDialog(Dialog<?> dialog) {
        dialog.onAccept[|modelObject.actualizar]
        dialog.open
    }
}