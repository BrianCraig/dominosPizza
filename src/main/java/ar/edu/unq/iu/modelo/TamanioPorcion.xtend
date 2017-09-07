package ar.edu.unq.iu.modelo
import ar.edu.unq.iu.modelo.TipoTamanio

class TamanioPorcion extends TipoTamanio {
	double PRECIO = 0.25 
	
	override getPrecio(){
		return PRECIO
	}
}