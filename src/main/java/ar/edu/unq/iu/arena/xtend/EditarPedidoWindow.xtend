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
import org.uqbar.arena.layout.HorizontalLayout

class EditarPedidoWindow extends TransactionalDialog<Pedido> {

	new(WindowOwner owner, Pedido model) {
		super(owner, model)
		title = defaultTitle
	}

	def defaultTitle() {
		"Editar Un Pedido"
	}

	override protected createFormPanel(Panel mainPanel) {
		this.panelDeEstado(mainPanel)
		this.panelDePlatos(mainPanel)
		this.panelDeAclaraciones(mainPanel)
		this.panelDeInfo(mainPanel)
	}

	def panelDeEstado(Panel panel){
		val layout = new Panel(panel).layout = new ColumnLayout(2)
		new Label(layout).text = "Estado:"
		new Selector<EstadoPedido>(layout)

		/*new Selector<EstadoPedido>(form) => [
		  	allowNull(false)
		  	value <=> "estado"
		  	val estados = bindItems(new ObservableProperty(repoEstados, "estados"))
		  	//estados.adaptWith(typeof(EstadoPedido), "nombre") // opci�n A

		  	estados.adapter = new PropertyAdapter(typeof(EstadoPedido), "nombre") // opci�n B
		 ]*/
	}

	def panelDePlatos(Panel panel) {
		{
			new Label(panel).text = "Platos:"

			val p = new Panel(panel, new PedidoAppModel(modelObject.platos)).layout = new HorizontalLayout()

			this.crearTablaPlato(p)
			this.crearAccionesTabla(p)
		}
	}

	def panelDeAclaraciones(Panel panel){
		new Label(panel).text = "Aclaraciones:"

		new TextBox(panel) => [
			value <=> "aclaraciones"
			width = 400
		]
	}

	def panelDeInfo(Panel panel){
		val form = new Panel(panel).layout = new ColumnLayout(2)

		new Label(form).text = "Cliente:"

		new Label(form) => [
			value <=> "cliente.nombre"
			alignLeft
		]

		new Label(form).text = "Costo de envio:"

		new Label(form) => [
			value <=> "envio.costo"
			alignLeft
		]

		new Label(form).text = "Monto total:"


		new Label(form) => [
			value <=> "monto"
			alignLeft
		]

		new Label(form).text = "Fecha:"


		new Label(form) => [
			value <=> "fechaHora"
			alignLeft
		]
	}

	def crearTablaPlato(Panel panel) {

		val table = new Table<Plato>(panel, typeof(Plato)) => [
			items <=> "platos"
			value <=> "platoSeleccionado"
			numberVisibleRows = 4
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
		val actionsPanel = new Panel(panel).layout = new VerticalLayout

		new Button(actionsPanel) => [
			caption = "Agregar"
			onClick([|this.agregarPlato()])

		]

		new Button(actionsPanel) => [
			caption = "Editar"
			onClick([|this.editarPlato(panel.modelObject)])
			bindEnabled(new NotNullObservable("platoSeleccionado"))
		]

		new Button(actionsPanel) => [
			caption = "Eliminar"
			onClick([|this.eliminarPlato(panel.modelObject)])
			bindEnabled(new NotNullObservable("platoSeleccionado"))

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
