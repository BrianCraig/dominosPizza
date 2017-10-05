package ar.edu.unq.iu.modelo

import java.time.LocalDateTime
import java.time.temporal.ChronoUnit
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.simplejavamail.email.Email
import org.simplejavamail.mailer.Mailer
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.annotations.Dependencies

@TransactionalAndObservable
@Accessors
class Pedido extends Entity{
	ConstructorEmail email = new ConstructorEmail()
	List<Plato> platos = new ArrayList()
	Cliente cliente
	LocalDateTime fechaHora
	String aclaraciones = ""
	Envio envio
	EstadoPedido estado
	int tiempoEspera
	Email mail
	
	
	
	new (Cliente cliente, Envio envio){
		this.cliente = cliente
		this.fechaHora = LocalDateTime.now()
		this.envio = envio
		this.estado = new Preparando
		cliente.agregarPedido(this)
		this.tiempoEspera = 0
	}
	
	@Dependencies("platos")
	def getMonto() {
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
		new Mailer("aspmx.l.google.com", 25, "e-mail", "constrase�a")
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
			new Mailer("aspmx.l.google.com", 25, "e-mail", "constrase�a")
				.sendMail(mail)
		}
	}

	def getPosiblesEstados() {
		estado.posiblesEstados(this)
	}

	def pasarAlSiguienteEstado() {
		if(null == estado.estadoSiguiente(envio)){
			throw new CambioDeEstadoException("imposible cambiar el estado del pedido")
		}
		estado = estado.estadoSiguiente(envio)
	}

	def pasarAlEstadoAnterior() {
		if(null == estado.estadoAnterior(envio)){
			throw new CambioDeEstadoException("imposible cambiar el estado del pedido")
		}
		estado = estado.estadoAnterior(envio)
	}
	
	def tieneEstadoAbierto() {
		estado.esAbierto()
	}
	
	def calcularTiempoEspera() { //TODO a arreglar
		//calcula la diferencia en minutos y los devuelve en int - verificar si sirve
		this.tiempoEspera = ChronoUnit.MINUTES.between(LocalDateTime.now, fechaHora).intValue
		
		//tiempoEspera = LocalDateTime.now().hour - fechaHora.hour
		//TODO: Comparar las fechas
		
	}

	def agregarPlato(Plato plato){
		if(! platos.contains(plato)){
			platos.add(plato)
		}
	}
}