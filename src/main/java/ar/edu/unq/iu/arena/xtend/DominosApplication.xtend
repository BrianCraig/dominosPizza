package ar.edu.unq.iu.arena.xtend

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import ar.edu.unq.iu.modelo.Menu
import ar.edu.unq.iu.modelo.Pizza
import ar.edu.unq.iu.modelo.Ingrediente
import ar.edu.unq.iu.modelo.Plato
import ar.edu.unq.iu.modelo.TamanioFamiliar
import ar.edu.unq.iu.modelo.Agregado
import ar.edu.unq.iu.modelo.LadoIzquierdo
import ar.edu.unq.iu.modelo.TamanioPorcion
import ar.edu.unq.iu.modelo.Pedido
import ar.edu.unq.iu.modelo.DominosPizza
import ar.edu.unq.iu.modelo.Retirar
import ar.edu.unq.iu.modelo.Cliente

class DominosApplication extends Application {


    static def void main(String[] args) {
        new DominosApplication().start()
    }

    override protected Window<?> createMainWindow() {
        return new DominosWindow(this, this.bootstrapBD)
    }

    def DominosPizza bootstrapBD() {
        val panceta = new Ingrediente("Panceta", 5.0)
        val morrones = new Ingrediente("Morrones", 3.5)
        val jamon = new Ingrediente("Jamon", 3.5)

        val jym = new Pizza("Jamon y Morrones", 70.0) => [
            agregarIngrediente(jamon)
            agregarIngrediente(morrones)
        ]
        val yoNoPediriaEsto = new Pizza("Panceta", 60.0) => [
            agregarIngrediente(panceta)
        ]

        val plato1 = new Plato(jym, new TamanioFamiliar) => [
            agregados.add(new Agregado(morrones, new LadoIzquierdo))
        ]

        val plato2 = new Plato(yoNoPediriaEsto, new TamanioPorcion)

        val pepito = new Cliente("nombre", "nick", "password", "mail", "direccion")

        val pedido = new Pedido(pepito, new Retirar(), 0)

        val menu = new Menu => [
            agregarIngredienteExtra(panceta)
            agregarIngredienteExtra(morrones)
            agregarIngredienteExtra(jamon)

            agregarPizza(jym)
            agregarPizza(yoNoPediriaEsto)
        ]

        new DominosPizza(menu) => [
            agregarPedido(pedido)
            clientes.add(pepito)
        ]
    }
}