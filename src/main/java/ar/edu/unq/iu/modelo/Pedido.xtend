package ar.edu.unq.iu.modelo

import java.util.ArrayList
import java.util.Date

class Pedido {
	
	ArrayList<Plato> platos
	
	double monto
	
	Cliente cliente
	
	Date fechaHora
	
	String aclaraciones
	
	TipoEnvio envio
	
	EstadoPedido estado
	
	new (ArrayList<Plato> platos, Cliente cliente, String aclaraciones, TipoEnvio envio){
		this.platos = platos
		this.cliente = cliente
		this.fechaHora = new Date() //TIME??
		this.aclaraciones = aclaraciones
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

}