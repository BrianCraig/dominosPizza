package ar.edu.unq.iu.modelo

import java.time.LocalDateTime
import java.util.ArrayList
import java.util.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Pedido extends Observable{
	
	List<Plato> platos = new ArrayList()
	double monto
	Cliente cliente
	LocalDateTime fechaHora
	String aclaraciones = ""
	Envio envio
	EstadoPedido estado
	
	new (Cliente cliente, Envio envio){
		this.cliente = cliente
		this.fechaHora = LocalDateTime.now()
		this.envio = envio
		this.estado = new Preparando()
		this.monto = this.calcularMonto()
	}
	
	def calcularMonto() {
		monto = envio.getCosto()
		for (p : platos) {
			monto += p.getPrecio() 
		}
		monto
	}
	
	def getMonto() {
		this.monto
	}

	def cancelarPedido(){
		this.estado = new Cerrado()
	}
	
	def getEstado() {
		estado
	}
	
	def enviar() {
		this.estado = new EnViaje()
		this.notifyObservers("Su pedido esta en viaje")
		
	}
	
	def entregar(){
		this.estado = new Entregado()
		this.verificarTiempo()
	}
	
	def verificarTiempo() {
		if (LocalDateTime.now().minusMinutes(30) >= fechaHora){
			this.notifyObservers("Enviar mail de disculpa")
		} 
		
	}
	
}