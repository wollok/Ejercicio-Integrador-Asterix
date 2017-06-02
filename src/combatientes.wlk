class Combatiente {
	method pelear(otro){
		otro.recibir(self.poder())
	}
	method poder()
}

class Persona inherits Combatiente{
	var fuerza
	var resistencia
	
	constructor(f, r){
		fuerza = f
		resistencia = r
	}
	
	method tomar(pocion) {
		pocion.esTomadaPor(self)
	}
	override method poder(){
		return fuerza * resistencia
	}
	method recibir(danio) {
		resistencia -= danio
		resistencia = resistencia.max(0)
	}
	method fueraCombate() {
		return resistencia == 0
	}
	method aumentaFuerza(cant) {
		fuerza += cant
	}
	method ponderaFuerza(mult) {
		fuerza *= mult
	}
	method aumentaResistencia(cant) {
		resistencia += cant
	}
	method ponderaResistencia(mult) {
		resistencia *= mult
	}
	method revivir(){
		resistencia = 2
	}
}


