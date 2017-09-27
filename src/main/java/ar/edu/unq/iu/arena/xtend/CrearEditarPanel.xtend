package ar.edu.unq.iu.arena.xtend

import org.uqbar.arena.widgets.Panel
import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.unq.iu.appmodel.CrearEditarRepoModel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.commons.model.Entity

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

/*
    panel generico para hacer un agregar / quitar /
*/

class CrearEditarPanel<T extends Entity> extends Panel {
    Class itemType

    new(Panel parent,CollectionBasedRepo<T> repo){
        super(parent, new CrearEditarRepoModel(repo));
        itemType = (modelObject as CrearEditarRepoModel).repo.entityType
        this.crearLayout()
    }

    def crearLayout(){
        new Label(this) => [
            text = "Ingredientes:"
            alignLeft
            fontSize = 12
        ]

        val sub = new Panel(this) => [
            layout = new HorizontalLayout()
        ]

        this.crearTabla(sub)
        //this.crearAccionesPizza(sub)
    }

    def crearTabla(Panel parent){
        val table = new Table<T>(parent, itemType) => [
            items <=> "objetos"
            value <=> "seleccionado"
            numberVisibleRows = 5
        ]


        new Column<T>(table) => [
            title = "Nombre"
            fixedSize = 200
            bindContentsToProperty("nombre")
        ]

        new Column(table) => [
            title = "Precio"
            fixedSize = 200
            bindContentsToProperty("precio")
        ]
    }
}