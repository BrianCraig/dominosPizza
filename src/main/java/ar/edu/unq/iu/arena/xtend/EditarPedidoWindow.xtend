package ar.edu.unq.iu.arena.xtend

import ar.edu.unq.iu.modelo.Pedido
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import ar.edu.unq.iu.modelo.EstadoPedido
import org.uqbar.arena.bindings.ObservableProperty

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.TextBox
import ar.edu.unq.iu.repo.RepoEstados
import ar.edu.unq.iu.modelo.Envio
import ar.edu.unq.iu.modelo.Cliente
import ar.edu.unq.iu.modelo.Plato
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.bindings.NotNullObservable

class EditarPedidoWindow extends TransactionalDialog<Pedido> {

	new(WindowOwner owner, Pedido model) {
		super(owner, model)
		title = defaultTitle
	}

	def defaultTitle() {
		"Editar Un Pedido"
	}

	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel).layout = new ColumnLayout(2)

		new Label(form).text = "Estado:"

		new Selector<EstadoPedido>(form) => [
			allowNull(false)
			value <=> "estado"
			val propiedadModelos = bindItems(new ObservableProperty(repoEstados, "estados"))
			propiedadModelos.adaptWith(typeof(EstadoPedido), "nombre") // opción A
			// propiedadModelos.adapter = new PropertyAdapter(typeof(Modelo), "descripcionEntera") // opción B
		]

		new Label(form).text = "Platos:"

		this.crearTablaPlato(new Table<Plato>(this, typeof(Plato)))

		new Label(form).text = "Aclaraciones:"

		new NumericField(form) => [
			value <=> "aclaraciones"
			width = 400
		]

		new Label(form).text = "Cliente:"

		// TODO: COMO HACER PARA QUE NO SE PUEDA EDITAR EL NOMBRE
		new TextBox(form) => [
			value <=> "nombre"
			val propiedadModelos = bindValue(new ObservableProperty(Pedido, "pedido"))
			propiedadModelos.adaptWith(typeof(Cliente), "nombre")
			width = 200
		]

		new Label(form).text = "Costo de envio:"

		// TODO: COMO HACER PARA QUE NO SE PUEDA EDITAR EL NOMBRE
		new TextBox(form) => [
			value <=> "nombre"
			val propiedadModelos = bindValue(new ObservableProperty(Pedido, "pedido"))
			propiedadModelos.adaptWith(typeof(Envio), "costo")
			width = 200
		]

		new Label(form).text = "Monto total:"

		// TODO: COMO HACER PARA QUE NO SE PUEDA EDITAR EL NOMBRE
		new TextBox(form) => [
			value <=> "monto"
			width = 200
		]

		new Label(form).text = "Fecha:"

		// TODO: COMO HACER PARA QUE NO SE PUEDA EDITAR EL NOMBRE
		new TextBox(form) => [
			value <=> "fechaHora"
			width = 200
		]
	}

	def crearTablaPlato(Table<Plato> table) {
		val elementSelected = new NotNullObservable("pedidoSeleccionado")
		
		new Column<Plato>(table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("pizza")
		]

		new Column<Plato>(table) => [
			title = "Tamaño"
			fixedSize = 200
			bindContentsToProperty("tamanio")
		]

		new Column<Plato>(table) => [
			title = "Precio"
			fixedSize = 200
			bindContentsToProperty("getPrecio")
		]

		new Button(this) => [
			caption = "Agregar"
			onClick([|this.agregarPlato(table)])

		]

		new Button(this) => [
			caption = "Editar"
			onClick([|this.editarPlato()])
			bindEnabled(elementSelected)
		]

		new Button(this) => [
			caption = "Editar"
			onClick([|this.eliminarPlato()])
			bindEnabled(elementSelected)
		]
	}

	def agregarPlato(Table<Plato> table) {
		this.openDialog(new AgregarEditarPlatoWindow(this, null))
	}

	def editarPlato() {
		this.openDialog(new AgregarEditarPlatoWindow(this, modelObject.platoSeleccionado))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject] // ??
		dialog.open

	}

	def eliminarPlato() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
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

	def getRepoEstados() {
		ApplicationContext.instance.getSingleton(typeof(EstadoPedido)) as RepoEstados
	}

}
