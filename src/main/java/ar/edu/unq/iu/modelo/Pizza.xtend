package ar.edu.unq.iu.modelo

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pizza {
	String nombre
	List<Ingrediente> ingredientes = new ArrayList()
	double precio
	
	new (String n, double p) {
		this.nombre = n
		this.precio = p
	}
}