package ar.edu.unq.iu.modelo

import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.Observable

@Observable
abstract class EstadoPedido extends Entity{
	public String nombre
	
	def List<EstadoPedido> posiblesEstados(Pedido p) {}

	def EstadoPedido estadoSiguiente(Envio envio) {}

	def EstadoPedido estadoAnterior(Envio envio) {}

	override equals(Object o) {
		this.class == o.class
	}

	def Boolean esAbierto()
	
	override toString()

}

// Todos los pedidos empiezan en estado preparando
class Preparando extends EstadoPedido {
	new(){
		nombre = "Preparando"
	}
	
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

	override toString (){
		"Preparando"
	}
}

// Si es de delivery (ListoParaEnviar -> EnViaje -> Entregado)
class ListoParaEnviar extends EstadoPedido {
	new(){
		nombre = "Listo Para Enviar"
	}
	
	override estadoSiguiente(Envio e) {
		new EnViaje()
	}

	override estadoAnterior(Envio e) {
		new Preparando()
	}

	override esAbierto() {
		true
	}

	override toString (){
		"Listo para enviar"
	}
}

class EnViaje extends EstadoPedido {
	new(){
		nombre = "En Viaje"
	}
	
	override estadoSiguiente(Envio e) {
		new Entregado()
	}

	override estadoAnterior(Envio e) {
		new ListoParaEnviar()
	}
	
	override esAbierto() {
		true
	}

	override toString (){
		"En viaje"
	}
}

class Entregado extends EstadoPedido {
	new(){
		nombre = "Entregado"
	}
	
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

	override toString (){
		"Entregado"
	}
}

// Si es para retirar (ListoParaRetirar ->  Entregado)
class ListoParaRetirar extends EstadoPedido {
	new(){
		nombre = "Listo Para Retirar"
	}
	
	override estadoSiguiente(Envio e) {
		new Entregado()
	}

	override estadoAnterior(Envio e) {
		new Preparando()
	}
	
	override esAbierto() {
		true
	}

	override toString (){
		"Listo para retirar"
	}
}

// Se puede cancelar en cualquier estado menos Cancelado
class Cancelado extends EstadoPedido {
	new(){
		nombre = "Cancelado"
	}
	
	override estadoSiguiente(Envio e) {
		throw new CambioDeEstadoException()
	}

	override estadoAnterior(Envio e) {
		throw new CambioDeEstadoException()
	}
	
	override esAbierto() {
		false
	}

	override toString (){
		"Cancelado"
	}
}

class CambioDeEstadoException extends RuntimeException {
	
}
