package ar.edu.unq.iu.modelo

import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
abstract class EstadoPedido extends Entity{
	
	
	def List<EstadoPedido> posiblesEstados(Pedido p) {}

	def EstadoPedido estadoSiguiente(Envio envio) {}

	def EstadoPedido estadoAnterior(Envio envio) {}

	override equals(Object o) {
		this.class == o.class
	}

	def Boolean esAbierto()
	
	override def toString()

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

	override estadoAnterior(Envio e) {
		throw new CambioDeEstadoException()
	}

	override esAbierto() {
		true
	}

	def nombre(){
		"Preparando"
	}

	override def toString (){
		nombre
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
	
	def nombre() {
		"Listo Para Enviar"
	}
	
}

class EnViaje extends EstadoPedido {
	new(){
		
	}
	
	def nombre(){
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
	
	def nombre(){
		"Entregado"
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

	override def toString (){
		nombre
	}
}

// Si es para retirar (ListoParaRetirar ->  Entregado)
class ListoParaRetirar extends EstadoPedido {
	new(){
	}
	
	def nombre(){
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
	
	def nombre(){
		"Cancelado"
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

	override def toString (){
		nombre
	}
}

class CambioDeEstadoException extends RuntimeException {
	
}
