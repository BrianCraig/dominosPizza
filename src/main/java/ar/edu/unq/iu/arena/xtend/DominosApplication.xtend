package ar.edu.unq.iu.arena.xtend

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class DominosApplication extends Application {


    static def void main(String[] args) {
        new DominosApplication().start()
    }

    override protected Window<?> createMainWindow() {
        return new DominosWindow(this)
    }

}