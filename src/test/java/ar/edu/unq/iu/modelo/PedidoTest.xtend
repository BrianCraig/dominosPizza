package ar.edu.unq.iu.modelo

import org.junit.Assert
import org.junit.Test
import org.junit.Before
import java.util.ArrayList

class PedidoTest {
	
	Pedido pedido
	ArrayList<Plato> platos
	Cliente cliente
	String aclaraciones
	Envio envio1
	Envio envio2
	Plato plato1
	Plato plato2
	
	@Before
	def void setUp(){
		platos = newArrayList
		platos.add(plato1)
		platos.add(plato2)
		cliente = new Cliente()
		envio1 = new Delivery("Calle Falsa 123")
		envio2 = new Retirar()

		pedido = new Pedido(cliente, envio1)
	}
	
	@Test
	def void testDadoUnPedidoCalculoSuPrecio(){
		Assert.assertTrue(pedido.getMonto() == 15.0)
	}
	
	@Test
	def void testDadoUnPedidoEsteEsCancelado(){
		pedido.cancelarPedido()
		var estadoCerrado = new Cerrado()
		
		Assert.assertTrue(pedido.getEstado().class == estadoCerrado.class)
	}
	
	@Test
	def void testDadoUnPedidoEnViajeSeLeNotificaAlCliente(){
		//para implementar
		pedido.enviar()
	}
	
	@Test
	def void testDadoUnPedidoQueTardoMasDe30MinutosEnserEntregadoSeVerificaQueElClienteRecibaElMailCorrespondiente(){
		// para implementar
		// se podria implementar creando el pedido, escuchando al observer del pedido
		// cambiando el tiempo del sistema, pasando el pedido a un estado entregado, y verificando el obs
	}
}






