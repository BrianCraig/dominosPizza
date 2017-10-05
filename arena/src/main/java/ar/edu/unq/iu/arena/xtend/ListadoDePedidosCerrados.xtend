package ar.edu.unq.iu.arena.xtend

import ar.edu.unq.iu.appmodel.ListadoDePedidos
import ar.edu.unq.iu.modelo.Pedido
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class ListadoDePedidosCerrados extends SimpleWindow<ListadoDePedidos>{
	
	new(WindowOwner parent) {
		super(parent, new ListadoDePedidos)
		modelObject.pedidosCerrados
	}
	
	
	override def createMainTemplate(Panel mainPanel) {
		title = "DominosPizza"
		taskDescription = "Pedidos cerrados"

		super.createMainTemplate(mainPanel)

		this.createResultsGrid(mainPanel)
		this.createGridActions(mainPanel)
	}
	
	def createGridActions(Panel panel) {
		
		val elementSelected = new NotNullObservable("pedidoSeleccionado")
		
		val actionsPanel = new Panel(panel).layout = new HorizontalLayout
		
		
		new Button(actionsPanel) => [
			caption = "Ver"
			onClick([|this.verPedido()])
			bindEnabled(elementSelected)
		]		
		
	}
	
	
	def verPedido() {
		this.openDialog(new EditarPedidoWindow(this, modelObject.pedidoSeleccionado))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject]// ??
		dialog.open
	}
	
	def createResultsGrid(Panel panel) {
		val table = new Table<Pedido>(panel, typeof(Pedido)) => [
			items <=> "pedidosCerrados"
			value <=> "pedidoSeleccionado"
			numberVisibleRows = 5
		]
		this.describeResultsGrid(table)
	}
	
	override protected addActions(Panel actionsPanel) {

		new Button(actionsPanel) => [
			caption = "Volver"
			onClick([|this.close])
		]

		
	}
	
	
	override protected createFormPanel(Panel mainPanel) {
		val searchFormPanel = new Panel(mainPanel) => [
			layout = new ColumnLayout(4)
		]

	}
	
	def void describeResultsGrid(Table<Pedido> table) {
		new Column<Pedido>(table) => [
			title = "Pedido"
			fixedSize = 50
			bindContentsToProperty("id")
		]

		new Column<Pedido>(table) => [
			title = "Estado"
			fixedSize = 100
			alignRight
			bindContentsToProperty("estado")
		]
		//TODO: adaptar

		new Column<Pedido>(table) => [
			title = "Fecha"
			fixedSize = 100
			bindContentsToProperty("fechaHora")
			
		]
		
		new Column<Pedido>(table) => [
			title = "Tiempo de espera"
			fixedSize = 50
			bindContentsToProperty("tiempoEspera")
		]
	}
	
	
	
}