package ar.edu.unq.iu.modelo

import java.time.LocalDateTime
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class Pedido extends Entity{
	List<Plato> platos = new ArrayList()
	Cliente cliente
	LocalDateTime fechaHora
	String aclaraciones = ""
	Envio envio
	EstadoPedido estado
	double monto
	
	new (Cliente cliente, Envio envio){
		this.cliente = cliente
		this.fechaHora = LocalDateTime.now()
		this.envio = envio
		this.estado = new Preparando
		cliente.agregarPedido(this)
		this.monto = calcularMonto()
	}
	
	def calcularMonto() {
        var monto = envio.getCosto()
        for (p : platos) {
            monto += p.getPrecio()
        }
        monto
	}

	def cancelarPedido(){
		this.estado = new Cancelado()
	}
	
	def enviar() {
		this.estado = new EnViaje()
		//this.notifyObservers("Su pedido esta en viaje")
	}
	
	def entregar(){
		this.estado = new Entregado()
		this.verificarTiempo()
	}
	
	def verificarTiempo() {
		if (LocalDateTime.now().minusMinutes(30) >= fechaHora){
			//this.notifyObservers("Enviar mail de disculpa")
		}
	}

	def getPosiblesEstados() {
		estado.posiblesEstados(this)
	}

	def setEstado(EstadoPedido estado) {
		this.estado = estado
	}
	
	def pasarAlSiguienteEstado() {
		estado = estado.estadoSiguiente(envio)
	}
	
	def pasarAlEstadoAnterior() {
		estado = estado.estadoAnterior(envio)
	}
	
	def tieneEstadoAbierto() {
		estado.esAbierto()
	}
	
}