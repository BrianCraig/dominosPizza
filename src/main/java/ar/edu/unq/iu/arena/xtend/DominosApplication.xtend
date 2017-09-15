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
import ar.edu.unq.iu.modelo.Retirar
import ar.edu.unq.iu.modelo.Cliente

class DominosApplication extends Application {


	new(DominosBootstrap b) {
		super(b)
	}
	
	static def void main(String[] args) {
        new DominosApplication (new DominosBootstrap).start()
    }

    override protected Window<?> createMainWindow() {
        return new ListadoDePedidosAbiertosWindow(this)
    }

    
}