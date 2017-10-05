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
	Envio delivery
	Envio retiro
	
	@Before
	def void setUp(){
		cliente = new Cliente("nombre", "nick", "password", "mail", "direccion")
		delivery = new Delivery("Calle Falsa 123")
		retiro = new Retirar()
		pedidoSinPlatos = new Pedido(cliente, delivery)
		pedidoConPlatos = new Pedido(cliente, retiro) => [
			platos.add(new Plato(new Pizza("muzza", 70.0), new TamanioGrande()))
		]
	}

	@Test
	def void testDadoUnPedidoSuEstadoEsEnPreparacion(){
		Assert.assertTrue(pedidoSinPlatos.getEstado().class == Preparando)
	}
	
	@Test
	def void testDadoUnPedidoCalculoSuPrecio(){
		Assert.assertTrue(pedidoSinPlatos.monto == 15.0)
		Assert.assertTrue(pedidoConPlatos.monto == 70.0)
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

	

	@Test(expected=CambioDeEstadoException)
	def void testUnPedidoEnEstadoPreparandoRompeSiLoQueremosPasarAlAnterior(){
		pedidoConPlatos.pasarAlEstadoAnterior()
	}
	
	@Test(expected=CambioDeEstadoException)
	def void testUnPedidoEnEstadoCanceladoRompeSiLoQueremosPasarAlAnterior(){
		pedidoConPlatos.estado = new Cancelado()
		pedidoConPlatos.pasarAlEstadoAnterior()
	}
	
	@Test(expected=CambioDeEstadoException)
	def void testUnPedidoEnEstadoEntregadoRompeSiLoQueremosPasarAlSiguiente(){
		pedidoConPlatos.estado = new Entregado()
		pedidoConPlatos.pasarAlSiguienteEstado()
	}
	
	@Test(expected=CambioDeEstadoException)
	def void testUnPedidoEnEstadoCanceladoRompeSiLoQueremosPasarAlSiguiente(){
		pedidoConPlatos.estado = new Cancelado()
		pedidoConPlatos.pasarAlSiguienteEstado()
	}

	@Test
	def void testUnPedidoParaEnviarPasaAEstadosSiguientes() {
		pedidoSinPlatos.pasarAlSiguienteEstado()
		
		Assert.assertEquals(pedidoSinPlatos.estado, new ListoParaEnviar())
		
		pedidoSinPlatos.pasarAlSiguienteEstado()
		
		Assert.assertEquals(pedidoSinPlatos.estado, new EnViaje())
		
		pedidoSinPlatos.pasarAlSiguienteEstado()
		
		Assert.assertEquals(pedidoSinPlatos.estado, new Entregado())
	}
	
	@Test
	def void testUnPedidoParaEnviarPasaAEstadosAnteriores() {
		pedidoSinPlatos.estado = new Entregado()
		
		pedidoSinPlatos.pasarAlEstadoAnterior()
		
		Assert.assertEquals(pedidoSinPlatos.estado, new EnViaje())
		
		pedidoSinPlatos.pasarAlEstadoAnterior()
		
		Assert.assertEquals(pedidoSinPlatos.estado, new ListoParaEnviar())
		
		pedidoSinPlatos.pasarAlEstadoAnterior()
		
		Assert.assertEquals(pedidoSinPlatos.estado, new Preparando())
	}

	@Test
	def void testUnPedidoParaRetirarPasaALosEstadosSiguientes() {
		pedidoConPlatos.pasarAlSiguienteEstado()
		
		Assert.assertEquals(pedidoConPlatos.estado, new ListoParaRetirar())
		
		pedidoConPlatos.pasarAlSiguienteEstado()
		
		Assert.assertEquals(pedidoConPlatos.estado, new Entregado())
	}
	
	@Test
	def void testUnPedidoParaRetirarPasaALosEstadosAnteriores() {
		pedidoConPlatos.estado = new Entregado()
		
		pedidoConPlatos.pasarAlEstadoAnterior()
		
		Assert.assertEquals(pedidoConPlatos.estado, new ListoParaRetirar())
		
		pedidoConPlatos.pasarAlEstadoAnterior()
		
		Assert.assertEquals(pedidoConPlatos.estado, new Preparando())
	}
}






