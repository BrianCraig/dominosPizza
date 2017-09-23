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
import ar.edu.unq.iu.appmodel.PedidoAppModel

class EditarPedidoWindow extends TransactionalDialog<PedidoAppModel> {

	new(WindowOwner owner, PedidoAppModel model) {
		super(owner, model)
		title = defaultTitle
	}

	def defaultTitle() {
		"Editar Un Pedido"
	}

	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel).layout = new ColumnLayout(3)

		new Label(form).text = "Estado:"

		new Selector<EstadoPedido>(form) => [
			allowNull(false)
			value <=> "estado"
			val estados = bindItems(new ObservableProperty(repoEstados, "estados"))
			estados.adaptWith(typeof(EstadoPedido), "nombre") // opción A
			// propiedadModelos.adapter = new PropertyAdapter(typeof(Modelo), "descripcionEntera") // opción B
		]

		new Label(form).text = "Platos:"

		this.crearTablaPlato(mainPanel)

		new Label(form).text = "Aclaraciones:"

		new TextBox(form) => [
			value <=> "aclaraciones"
			width = 400
		]

		new Label(form).text = "Cliente:"

		// TODO: COMO HACER PARA QUE NO SE PUEDA EDITAR EL NOMBRE
		new TextBox(form) => [
			value <=> "nombre"
			val pedido = bindValue(new ObservableProperty(Pedido, "pedido"))
			pedido.adaptWith(typeof(Cliente), "nombre")
			width = 200
		]

		new Label(form).text = "Costo de envio:"

		// TODO: COMO HACER PARA QUE NO SE PUEDA EDITAR EL NOMBRE
		new TextBox(form) => [
			value <=> "nombre"
			val costo = bindValue(new ObservableProperty(Pedido, "pedido"))
			costo.adaptWith(typeof(Envio), "costo")
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

	def crearTablaPlato(Panel panel) {
		val table = new Table<Plato>(panel, typeof(Plato)) => [
			items <=> "platos"
			value <=> "platoSeleccionado"
			numberVisibleRows = 10
		]
		
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
			caption = "Eliminar"
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
		modelObject.eliminarPlato()
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
