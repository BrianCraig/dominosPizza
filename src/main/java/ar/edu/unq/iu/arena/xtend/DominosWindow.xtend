package ar.edu.unq.iu.arena.xtend

import ar.edu.unq.iu.modelo.Menu
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

/**
 * Ventana de principal de Dominos Pizza <3
 */
class DominosWindow extends SimpleWindow<DominosPizza> {

    new(WindowOwner parent, DominosPizza m) {
        super(parent, m)
    }

    override createContents(Panel panel) {
        val principal = this.estructuraPrincipal(panel)
        val superior = this.estructuraSuperior(principal)
        val pedidos = this.panelPedidos(superior)
        val botones = this.panelBotones(superior)
        val inferior = this.estructuraInferior(principal)
    }

    def estructuraPrincipal(Panel panel){
        this.title = "Dominos Pizza Admin"
        // no es necesario, el layout default es el vertical
        panel.layout = new VerticalLayout
        panel
    }

    def estructuraSuperior(Panel panel){
        new Panel(panel) => [
            layout = new HorizontalLayout
        ]
    }

    def panelPedidos(Panel panel){
        val pedidos = new Panel(panel) => [
            width = 500
        ]
        new Label(pedidos) => [
            text = "Pedidos abiertos"
            fontSize = 12
            alignLeft
        ]
        new Label(pedidos).text = "Aca va la tabla de pedidos abiertos \n \n \n \n \n \n"
        pedidos
    }

    def panelBotones(Panel panel){
        val botones = new Panel(panel) => [
            width = 100
        ]
        new Button(botones).caption = "<< >>"
        new Button(botones).caption = "Cancelar"
        new Button(botones).caption = "Editar"
        botones
    }

    def estructuraInferior(Panel panel) {
        val cont = new Panel(panel) => [
            layout = new HorizontalLayout
        ]
        new Button(cont).caption = "Menu"
        new Button(cont).caption = "Pedidos cerrados"
        new Button(cont).caption = "Salir"
        cont
    }

    override addActions(Panel panel) {}

    override createFormPanel(Panel panel) {}
}