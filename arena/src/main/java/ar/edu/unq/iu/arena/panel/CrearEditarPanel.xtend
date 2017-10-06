package ar.edu.unq.iu.arena.panel

import ar.edu.unq.iu.appmodel.CrearEditarRepoModel
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.Entity

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

/*
    panel generico para hacer un agregar / quitar / eliminar
*/

abstract class CrearEditarPanel<T extends Entity> extends Panel {
    public Table<T> tabla
    public Panel acciones
    public String titulo = ""

    new(Panel parent,CollectionBasedRepo<T> repo){
        super(parent, new CrearEditarRepoModel<T>(repo));
        this.crearLayout()
    }

    override CrearEditarRepoModel<T> getModelObject() {
        super.getModelObject() as CrearEditarRepoModel<T>
    }

    def itemType() {
        modelObject.repo.entityType
    }

    def crearLayout(){
        new Label(this) => [
            text = this.titulo
            alignLeft
            fontSize = 12
        ]

        val sub = new Panel(this) => [
            layout = new HorizontalLayout()
        ]

        this.crearTabla(sub)
        this.crearAcciones(sub)
    }

    def crearTabla(Panel parent){
        this.tabla = new Table<T>(parent, itemType) => [
            items <=> "objetos"
            value <=> "seleccionado"
            numberVisibleRows = 5
        ]
    }

    def crearAcciones(Panel panel) {

        this.acciones = new Panel(panel).layout = new VerticalLayout

        new Button(acciones) => [
            caption = "Crear"
            onClick([|this.crear()])
        ]

        new Button(acciones) => [
            caption = "Editar"
            onClick([|this.editar(modelObject.seleccionado)])
            bindEnabled(new NotNullObservable("seleccionado"))
        ]

        new Button(acciones) => [
            caption = "Eliminar"
            onClick([|this.eliminar(modelObject.seleccionado)])
            bindEnabled(new NotNullObservable("seleccionado"))
        ]
    }

    def void crear();
    def void editar(T modelo);

    def eliminar(T modelo) {
        modelObject.repo.delete(modelo)
        modelObject.seleccionado = null
        modelObject.actualizar
    }
}