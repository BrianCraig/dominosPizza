package ar.edu.unq.iu.arena.window

import ar.edu.unq.iu.appmodel.PlatoAppModel
import ar.edu.unq.iu.modelo.Agregado
import ar.edu.unq.iu.modelo.Ingrediente
import ar.edu.unq.iu.modelo.LadoAmbos
import ar.edu.unq.iu.modelo.LadoDerecho
import ar.edu.unq.iu.modelo.LadoIzquierdo
import ar.edu.unq.iu.modelo.Pedido
import ar.edu.unq.iu.modelo.Pizza
import ar.edu.unq.iu.modelo.Plato
import ar.edu.unq.iu.modelo.Tamanio
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.RadioSelector
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.model.annotations.TransactionalAndObservable

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AgregarEditarPlatoWindow extends TransactionalDialog<PlatoAppModel> {

	new(WindowOwner owner, Pedido pedido, Plato plato) {
		super(owner, new PlatoAppModel(pedido, plato))
		title = "Editar Plato"
	}

	override protected createFormPanel(Panel mainPanel) {

		val form = new Panel(mainPanel).layout = new ColumnLayout(2)

		new Label(form).text = "Pizza:"

		new Selector<Pizza>(form) => [
			allowNull(false)
			value <=> "plato.pizza"
			items <=> "repoPizza.objects"
		]

		new Label(form).text = "Tama�o:"

		new Selector<Tamanio>(form) => [
			allowNull(false)
			value <=> "plato.tamanio"
			items <=> "tamanios"
		]

		new Label(form).text = "Precio:"

		new Label(form) => [
			value <=> "plato.precio"
		]

		this.mostrarIngredientes(mainPanel)


	}



	def mostrarIngredientes(Panel panel) {
		for (ingrediente : modelObject.ingredientesPosibles()) {

			val fila = new Panel(panel, new PlatoIngredienteModel(modelObject.plato, ingrediente)).layout = new HorizontalLayout

			new CheckBox(fila) => [
				value <=> "contieneAgregado"
			]

			new Label(fila).text = ingrediente.getNombre()


			new RadioSelector(fila) => [
			items <=> "posiblesLados"
			value <=> "agregado.lado"
			]
		}
	}



	override protected void addActions(Panel actions) {
		new Button(actions) => [
			caption = "Aceptar"
			onClick [|this.accept]
		]

		new Button(actions) => [
			caption = "Cancelar"
			onClick [|this.cancel]
		]
	}

	override executeTask() {
		modelObject.agregarPlato
		super.executeTask()
	}

}

@TransactionalAndObservable
@Accessors
class PlatoIngredienteModel implements Serializable { //modelo!
	Plato plato
	Ingrediente ingrediente
	Agregado agregado

	new(Plato plato, Ingrediente ingrediente){
		this.plato = plato
		this.ingrediente = ingrediente
		if(plato.contieneAgregadoDe(ingrediente))
			this.agregado = plato.agregadoDe(ingrediente)
		else
			this.agregado = new Agregado(ingrediente, new LadoAmbos)
	}

	def Boolean getContieneAgregado(){
		plato.contieneAgregadoDe(ingrediente)
	}

	def void setContieneAgregado(Boolean agregar){
		if(agregar){
			plato.agregarAgregado(agregado)
		} else {
			plato.quitarAgregado(agregado)
		}
	}

	def getPosiblesLados() {
		#[new LadoIzquierdo, new LadoAmbos, new LadoDerecho]
	}
}
