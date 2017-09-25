package ar.edu.unq.iu.arena.xtend

import org.uqbar.arena.windows.SimpleWindow

import ar.edu.unq.iu.modelo.Pedido
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.Window
import ar.edu.unq.iu.appmodel.ListadoDePedidos

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.ObservableProperty
import ar.edu.unq.iu.modelo.EstadoPedido
import org.uqbar.arena.layout.VerticalLayout
import ar.edu.unq.iu.appmodel.PedidoAppModel
import java.text.SimpleDateFormat
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

class ListadoDePedidosAbiertosWindow extends SimpleWindow<ListadoDePedidos> {
	
	new(WindowOwner parent) {
		super(parent, new ListadoDePedidos)
		modelObject.pedidosAbiertos
		
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "DominosPizza"
		taskDescription = "Pedidos abiertos"
		super.createMainTemplate(mainPanel)
	}

	override protected createFormPanel(Panel mainPanel) {
		val horLayout = new Panel(mainPanel).layout = new HorizontalLayout
		this.createResultsGrid(horLayout)
		this.createGridActions(horLayout)
	}
	
	def createGridActions(Panel panel) {
		val actionsPanel = new Panel(panel).layout = new VerticalLayout
		
		new Button(actionsPanel) => [
			caption = "Cancelar"
			onClick([|modelObject.cancelarPedido()])
			bindEnabled(new NotNullObservable("pedidoSeleccionado"))
		]
		
		new Button(actionsPanel) => [
			caption = "Editar"
			onClick([|this.editarPedido()])
			bindEnabled(new NotNullObservable("pedidoSeleccionado"))
		]

		val horLayout = new Panel(actionsPanel).layout = new HorizontalLayout

		new Button(horLayout) => [
			caption = "<<"
			onClick([|this.estadoAnterior(modelObject.pedidoSeleccionado)])
			bindEnabled(new NotNullObservable("pedidoSeleccionado"))
		]
		
		new Button(horLayout) => [
			caption = ">>"
			onClick([|this.estadoSiguiente(modelObject.pedidoSeleccionado)])
			bindEnabled(new NotNullObservable("pedidoSeleccionado"))
		]
		
		
	}
	
	def estadoSiguiente(Pedido p) {
		p.pasarAlSiguienteEstado
	}
	
	def estadoAnterior(Pedido p) {
		p.pasarAlEstadoAnterior
	}
	
	def editarPedido() {
		this.openDialog(new EditarPedidoWindow(this, modelObject.pedidoSeleccionado))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject]// ??
		dialog.open
	}
	
	def createResultsGrid(Panel panel) {
		val table = new Table<Pedido>(panel, typeof(Pedido)) => [
			items <=> "pedidosAbiertos"
			value <=> "pedidoSeleccionado"
			numberVisibleRows = 5
		]
		this.describeResultsGrid(table)
	}
	
	override protected addActions(Panel actionsPanel) {

		new Button(actionsPanel) => [
			caption = "Menu"
			onClick([|this.abrirMenu()])
		]

		new Button(actionsPanel) => [
			caption = "Pedidos Cerrados"
			onClick([|this.pedidosCerrados()])
		]
		
		new Button(actionsPanel) => [
			caption = "Salir"
			onClick([|this.close])
		]
		
	}
	
	def pedidosCerrados() {
		this.openWindow(new ListadoDePedidosCerrados(this))
	}
	
	def openWindow(Window<?> window) {
		//window.onAccept[|modelObject]// ??
		window.open
	}
	
	def abrirMenu() {
		this.openWindow(new MenuWindow(this))
	}
	
	def void describeResultsGrid(Table<Pedido> table) {
		new Column<Pedido>(table) => [
			title = "Pedido"
			fixedSize = 50
			bindContentsToProperty("id")
			
		]

		new Column<Pedido>(table) => [
			title = "Estado"
			fixedSize = 120
			alignRight
			bindContentsToProperty("estado")
			//TODO: adaptar
		]

		new Column<Pedido>(table) => [
			title = "Monto"
			fixedSize = 50
			bindContentsToProperty("monto")
		]

		new Column<Pedido>(table) => [
			title = "Hora"
			fixedSize = 120
			bindContentsToProperty("fechaHora").transformer = [ LocalDateTime fecha | DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm").format(fecha)]
		]
	}
	
	
	
}