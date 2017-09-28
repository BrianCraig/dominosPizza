package ar.edu.unq.iu.modelo

import java.util.List
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
abstract class EstadoPedido extends Entity{
	
	
	def List<EstadoPedido> posiblesEstados(Pedido p) {}

	def EstadoPedido estadoSiguiente(Envio envio) {
		null;
	}

	def EstadoPedido estadoAnterior(Envio envio) {
		null;
	}

	override equals(Object o) {
		this.class == o.class
	}

	def Boolean esAbierto()

	def String nombre()
	
	override def toString(){
		this.nombre
	}

}

// Todos los pedidos empiezan en estado preparando
class Preparando extends EstadoPedido {
	new(){
		
	}
	
	override estadoSiguiente(Envio e) {
		if (e == new Retirar()) {
			return new ListoParaRetirar()
		} else {
			return new ListoParaEnviar()
		}
	}

	override esAbierto() {
		true
	}

	override nombre(){
		"Preparando"
	}
}

// Si es de delivery (ListoParaEnviar -> EnViaje -> Entregado)
class ListoParaEnviar extends EstadoPedido {
	new(){
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

	override def toString (){
		nombre
	}

	override nombre() {
		"Listo Para Enviar"
	}
	
}

class EnViaje extends EstadoPedido {
	new(){
		
	}

	override nombre(){
		"En Viaje"
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

	override def toString (){
		nombre
	}
}

class Entregado extends EstadoPedido {
	new(){
	}

	override nombre(){
		"Entregado"
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

	override def toString (){
		nombre
	}
}

// Si es para retirar (ListoParaRetirar ->  Entregado)
class ListoParaRetirar extends EstadoPedido {
	new(){
	}

	override nombre(){
		"Listo Para Retirar"
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

	override def toString (){
		nombre
	}
}

// Se puede cancelar en cualquier estado menos Cancelado
class Cancelado extends EstadoPedido {
	new(){
	}

	override nombre(){
		"Cancelado"
	}
	
	override esAbierto() {
		false
	}

	override def toString (){
		nombre
	}
}

class CambioDeEstadoException extends RuntimeException {
	
}
