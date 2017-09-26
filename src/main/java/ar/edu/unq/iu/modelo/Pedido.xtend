package ar.edu.unq.iu.modelo

import java.time.LocalDateTime
import java.time.temporal.ChronoUnit
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.simplejavamail.email.Email
import org.simplejavamail.mailer.Mailer
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class Pedido extends Entity{
	ConstructorEmail email = new ConstructorEmail()
	List<Plato> platos = new ArrayList()
	Cliente cliente
	LocalDateTime fechaHora
	String aclaraciones = ""
	Envio envio
	EstadoPedido estado
	double monto
	LocalDateTime tiempoEspera
	Email mail
	
	
	
	new (Cliente cliente, Envio envio){
		this.cliente = cliente
		this.fechaHora = LocalDateTime.now()
		this.envio = envio
		this.estado = new Preparando
		cliente.agregarPedido(this)
		this.monto = calcularMonto()
		this.tiempoEspera = null
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
		mail = email.pedidoATiempo(this.cliente.direccion)
		new Mailer("aspmx.l.google.com", 25, "e-mail", "constraseña")
			.sendMail(mail)
	}
	
	def entregar(){
		this.estado = new Entregado()
		this.verificarTiempo()
		this.calcularTiempoEspera()
	}
	
	def verificarTiempo() {
		if (LocalDateTime.now().minusMinutes(30) >= fechaHora){
			mail = email.pedidoConDemora(this.cliente.direccion)
			new Mailer("aspmx.l.google.com", 25, "e-mail", "constraseña")
				.sendMail(mail)
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
	
	def calcularTiempoEspera() {
		//calcula la diferencia en minutos y los devuelve en int - verificar si sirve
		ChronoUnit.MINUTES.between(LocalDateTime.now, fechaHora).intValue 
		
		//tiempoEspera = LocalDateTime.now().hour - fechaHora.hour
		//TODO: Comparar las fechas
		
	}
	
	
	
}