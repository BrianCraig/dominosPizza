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
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.bindings.PropertyAdapter
import ar.edu.unq.iu.modelo.Pizza
import ar.edu.unq.iu.repo.RepoPedido

class EditarPedidoWindow extends TransactionalDialog<Pedido> {

	new(WindowOwner owner, Pedido model) {
		super(owner, model)
		title = defaultTitle
	}

	def defaultTitle() {
		"Editar Un Pedido"
	}

	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel).layout = new ColumnLayout(1)

		new Label(form).text = "Estado:"

		/*new Selector<EstadoPedido>(form) => [
		  	allowNull(false)
		  	value <=> "estado"
		  	val estados = bindItems(new ObservableProperty(repoEstados, "estados"))
		  	//estados.adaptWith(typeof(EstadoPedido), "nombre") // opci�n A
		  
		  	estados.adapter = new PropertyAdapter(typeof(EstadoPedido), "nombre") // opci�n B
		 ]*/
		 
		this.panelDePlatos(mainPanel)

		new Label(form).text = "Aclaraciones:"

		new TextBox(form) => [
			value <=> "aclaraciones"
			width = 400
		]

		new Label(form).text = "Cliente:"

		new TextBox(form) => [
			value <=> "cliente.nombre"
			
			width = 200
		]

		new Label(form).text = "Costo de envio:"

		new TextBox(form) => [
			value <=> "envio.costo"
			
			width = 200
		]

		new Label(form).text = "Monto total:"

		
		new TextBox(form) => [
			value <=> "monto"
			width = 200
		]

		new Label(form).text = "Fecha:"

		
		new TextBox(form) => [
			value <=> "fechaHora"
			width = 200
		]
	}

	def panelDePlatos(Panel panel) {
		{
			val p = new Panel(panel, new PedidoAppModel(modelObject.platos))

			new Label(p).text = "Platos:"

			this.crearTablaPlato(p)
			this.crearAccionesTabla(p)
		}
	}

	def crearTablaPlato(Panel panel) {

		val table = new Table<Plato>(panel, typeof(Plato)) => [
			items <=> "platos"
			value <=> "platoSeleccionado"
			numberVisibleRows = 10
		]

		new Column<Plato>(table) => [
			title = "Nombre"
			fixedSize = 200
			alignRight
			bindContentsToProperty("pizza.nombre") // TODO: Adapt 
		]

		new Column<Plato>(table) => [
			title = "Tamanio"
			fixedSize = 200
			bindContentsToProperty("tamanio.nombre") // TODO: Adapt 
		]

		new Column<Plato>(table) => [
			title = "Precio"
			fixedSize = 200
			bindContentsToProperty("precio")
		]

	}

	def crearAccionesTabla(Panel panel) {
		val elementSelected = new NotNullObservable("platoSeleccionado")

		val actionsPanel = new Panel(panel).layout = new VerticalLayout

		new Button(actionsPanel) => [
			caption = "Agregar"
			onClick([|this.agregarPlato()])

		]

		new Button(actionsPanel) => [
			caption = "Editar"
			onClick([|this.editarPlato(panel.modelObject)])
			bindEnabled(elementSelected)
		]

		new Button(actionsPanel) => [
			caption = "Eliminar"
			onClick([|this.eliminarPlato(panel.modelObject)])
			bindEnabled(elementSelected)

		]
	}

	def agregarPlato() {

		this.openDialog(new AgregarEditarPlatoWindow(this, new Plato(null, null)))
	}

	def editarPlato(Object o) {
		var p = o as PedidoAppModel
		this.openDialog(new AgregarEditarPlatoWindow(this, p.platoSeleccionado))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject] // ??
		dialog.open

	}

	def eliminarPlato(Object o) {
		var p = o as PedidoAppModel
		p.eliminarPlato()
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
			onClick [|this.cancel]
			setAsDefault
			disableOnError
		]
	}

	def getRepoEstados() {
		ApplicationContext.instance.getSingleton(typeof(EstadoPedido)) as RepoEstados
	}
	
	override executeTask() {
		if (modelObject.isNew) {
			repoPedido.create(modelObject)
		} else {
			repoPedido.update(modelObject)
		}
		super.executeTask()
	}
	
	def getRepoPedido() {
		ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedido
	}

}
