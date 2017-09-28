package ar.edu.unq.iu.arena.xtend

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

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