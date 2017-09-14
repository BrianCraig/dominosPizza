package ar.edu.unq.iu.arena.xtend

import ar.edu.unq.iu.modelo.Menu
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.windows.SimpleWindow

/**
 * Ventana de principal de Dominos Pizza <3
 */
class DominosWindow extends SimpleWindow<Menu> {

    new(WindowOwner parent) {
        super(parent, new Menu)
    }

    override createContents(Panel panel) {
        this.estructuraPrincipal(panel)
        new Label(panel).text = "arriba"
        new Label(panel).text = "abajo"
    }

    def estructuraPrincipal(Panel panel){
        this.title = "Dominos Pizza Admin"
        // no es necesario, el layout default es el vertical
        panel.layout = new VerticalLayout
    }

    override addActions(Panel panel) {}

    override createFormPanel(Panel panel) {}


}