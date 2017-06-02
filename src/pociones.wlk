class Pocion{
	var ingredientes = []
	
	method esTomadaPor(alguien) {
		ingredientes.forEach{ing=>ing.afectar(alguien)}
	}
	method agregarIngrediente(ingrediente) {
		ingredientes.add(ingrediente)
	}
}

object dulceDeLeche{
	
	method afectar(alguien) {
		alguien.aumentaFuerza(10)
		if (alguien.fueraCombate()) 
			alguien.revivir()
	}
}

class Aceite {
	var dosis
	
	constructor(d){
		dosis = d
	}
	
	method afectar(alguien) {
		alguien.ponderaFuerza(dosis)
	}
}

class Zumo inherits Aceite {
	
	constructor(d) = super(d)
	
	override method afectar(alguien){
		super(alguien)
		alguien.aumentaResistencia(1)
	}
}

class Manojo {
	var tamanio
	
	constructor(t){
		tamanio = t
	}
	
	method afectar(alguien){
		alguien.aumentaFuerza(tamanio)
		if (tamanio>5) 
			alguien.ponderaResistencia(0.5)
	}
}
