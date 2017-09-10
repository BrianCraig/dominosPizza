package ar.edu.unq.iu.modelo

import org.junit.Assert
import org.junit.Test
import org.junit.Before
import java.util.ArrayList

class PedidoTest {
	Pedido pedidoSinPlatos
	Pedido pedidoConPlatos
	Cliente cliente
	String aclaraciones
	Envio envio1
	Envio envio2
	
	@Before
	def void setUp(){
		cliente = new Cliente()
		envio1 = new Delivery("Calle Falsa 123")
		envio2 = new Retirar()
		pedidoSinPlatos = new Pedido(cliente, new Delivery("Calle Falsa 123"))
		pedidoConPlatos = new Pedido(cliente, new Retirar()) => [
			platos.add(new Plato(new Pizza("muzza", 70.0), new TamanioPorcion()))
		]
	}

	@Test
	def void testDadoUnPedidoSuEstadoEsEnPreparacion(){
		Assert.assertTrue(pedidoSinPlatos.getEstado().class == Preparando)
	}
	
	@Test
	def void testDadoUnPedidoCalculoSuPrecio(){
		Assert.assertTrue(pedidoSinPlatos.monto == 15.0)
	}
	
	@Test
	def void testDadoUnPedidoEsteEsCancelado(){
		pedidoSinPlatos.cancelarPedido()
		Assert.assertTrue(pedidoSinPlatos.getEstado().class == Cancelado)
	}
	
	@Test
	def void testDadoUnPedidoQueTardoMasDe30MinutosEnserEntregadoSeVerificaQueElClienteRecibaElMailCorrespondiente(){
		// para implementar
		// se podria implementar creando el pedido, escuchando al observer del pedido
		// cambiando el tiempo del sistema, pasando el pedido a un estado entregado, y verificando el obs
	}

	@Test
	def void testUnPedidoParaRetirarPuedePasarAEstadoListoParaRetirar() {
		pedidoConPlatos.envio = new Retirar()

		Assert.assertTrue(
			pedidoConPlatos.posiblesEstados.stream.anyMatch(
				[estado | estado.class == ListoParaRetirar]
			)
		)
	}

	@Test
	def void testUnPedidoParaRetirarNoPuedePasarAEstadoListoParaEnviar() {
		pedidoConPlatos.envio = new Retirar()
		Assert.assertFalse(
			pedidoConPlatos.posiblesEstados.stream.anyMatch(
				[estado | estado.class == ListoParaEnviar]
			)
		)
	}

	@Test(expected=CambioDeEstadoException)
	def void testUnPedidoEnEstadoPreparandoRompeSiLoPasamosAEstadoEntregado(){
		pedidoConPlatos.estado = new Entregado
	}
}






