package ar.edu.unq.iu.modelo

import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.Entity

abstract class EstadoPedido extends Entity{
	public String nombre
	
	def List<EstadoPedido> posiblesEstados(Pedido p) {}

	def EstadoPedido estadoSiguiente(Envio envio) {}

	def EstadoPedido estadoAnterior(Envio envio) {}

	override equals(Object o) {
		this.class == o.class
	}

	def Boolean esAbierto()

}

// Todos los pedidos empiezan en estado preparando
class Preparando extends EstadoPedido {
	new(){
		nombre = "Preparando"
	}
	
	/*override def posiblesEstados (Pedido p){
	 *     val List<EstadoPedido> lista = new ArrayList()
	 *     lista.add(new Cancelado)
	 *     if(p.envio.class == Delivery) lista.add(new ListoParaEnviar)
	 *     if(p.envio.class == Retirar) lista.add(new ListoParaRetirar)
	 *     lista
	 }*/
	override estadoSiguiente(Envio e) {
		if (e == new Retirar()) {
			return new ListoParaRetirar()
		} else {
			return new ListoParaEnviar()
		}
	}

	override estadoAnterior(Envio e) {
		throw new CambioDeEstadoException()
	}

	override esAbierto() {
		true
	}

}

// Si es de delivery (ListoParaEnviar -> EnViaje -> Entregado)
class ListoParaEnviar extends EstadoPedido {
	new(){
		nombre = "Listo Para Enviar"
	}
	
	/*override def posiblesEstados (Pedido p){
	 *     #[new Preparando, new EnViaje, new Cancelado]
	 }*/
	override estadoSiguiente(Envio e) {
		new EnViaje()
	}

	override estadoAnterior(Envio e) {
		new Preparando()
	}

	override esAbierto() {
		true
	}

}

class EnViaje extends EstadoPedido {
	
	new(){
		nombre = "En Viaje"
	}
	
	/*def override posiblesEstados (Pedido p){
	 *     #[new ListoParaEnviar, new Entregado, new Cancelado]
	 }*/
	override estadoSiguiente(Envio e) {
		new Entregado()
	}

	override estadoAnterior(Envio e) {
		new ListoParaEnviar()
	}
	
	override esAbierto() {
		true
	}

}

class Entregado extends EstadoPedido {
	new(){
		nombre = "Entregado"
	}
	
	/*def override posiblesEstados (Pedido p){
	 *     #[]
	 }*/
	override estadoSiguiente(Envio e) {
		throw new CambioDeEstadoException()
	}

	override estadoAnterior(Envio e) {
		if (e == new Retirar()) {
			return new ListoParaRetirar()
		} else {
			return new EnViaje()
		}
	}
	
	override esAbierto() {
		false
	}

}

// Si es para retirar (ListoParaRetirar ->  Entregado)
class ListoParaRetirar extends EstadoPedido {
	new(){
		nombre = "Listo Para Retirar"
	}
	
	/*def override posiblesEstados (Pedido p){
	 *     #[new Preparando, new Entregado, new Cancelado]
	 }*/
	override estadoSiguiente(Envio e) {
		new Entregado()
	}

	override estadoAnterior(Envio e) {
		new Preparando()
	}
	
	override esAbierto() {
		true
	}

}

// Se puede cancelar en cualquier estado menos Cancelado
class Cancelado extends EstadoPedido {
	new(){
		nombre = "Cancelado"
	}
	
	/*def override posiblesEstados (Pedido p){
	 *     #[]
	 }*/
	override estadoSiguiente(Envio e) {
		throw new CambioDeEstadoException()
	}

	override estadoAnterior(Envio e) {
		throw new CambioDeEstadoException()
	}
	
	override esAbierto() {
		false
	}
	
}

class CambioDeEstadoException extends RuntimeException {
}
