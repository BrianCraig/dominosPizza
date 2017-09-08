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
	
	TipoEnvio envio1
	
	TipoEnvio envio2
	
	Plato plato1
	
	Plato plato2
	
	@Before
	def void setUp(){
		
		
		platos = newArrayList
		platos.add(plato1)
		platos.add(plato2)
		
		cliente = new Cliente()
		
		aclaraciones = "Sin sal"
		
		envio1 = new Delivery("Calle Falsa 123")
		
		envio2 = new Retirar()
	}
	
	@Test
	def void testDadoUnPedidoCalculoSuPrecio(){
		pedido = new Pedido(platos, cliente, aclaraciones, envio1)
		
		Assert.assertTrue(pedido.getMonto() == 15.0)
	}
	
	@Test
	def void testDadoUnPedidoEsteEsCancelado(){
		pedido = new Pedido(platos, cliente, aclaraciones, envio2)
		pedido.cancelarPedido()
		var estadoCerrado = new Cerrado()
		
		Assert.assertTrue(pedido.getEstado().class == estadoCerrado.class)
	}
	
	@Test
	def void testDadoUnPedidoEnViajeSeLeNotificaAlCliente(){
		pedido = new Pedido(platos, cliente, aclaraciones, envio1)
		pedido.enviar()
		
	}
	
	@Test
	def void testDadoUnPedidoQueTardoMasDe30MinutosEnserEntregadoSeVerificaQueElClienteRecibaElMailCorrespondiente(){
		// para implementar
		// se podria implementar creando el pedido, escuchando al observer del pedido
		// cambiando el tiempo del sistema, pasando el pedido a un estado entregado, y verificando el obs
	}
}






