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

class Grupo inherits Combatiente{
	var integrantes = []
	
	override method poder(){
		return integrantes.filter{int=>not int.fueraCombate()}
			.sum{int=>int.poder()}
	}
	method recibir(danio){
		integrantes.sortBy{int=>int.poder()}.take(10)
			.forEach{int=>int.recibir(danio/10)}
	}
}

class Legion inherits Grupo {
	var formacion = cuadro
	const minimo = 10
	
	override method poder(){
		return formacion.poder(self)
	}
	override method recibir(danio){
		formacion.recibir(danio,self)
		if(self.poder()<minimo)
			self.formacion(tortuga)
	}
	method formacion(f){
		formacion = f
	}
	method recibirMitad(danio){
		integrantes.take(integrantes.size().div(2))
			.forEach{int=>int.recibir(danio*2)}
	}
	
}

object tortuga{
	method poder(legion) {
		return 0
	}
	method recibir(danio, legion){}
}

object cuadro{
	method poder(legion) {
		return legion.poder()
	}
	method recibir(danio, legion) {
		legion.recibir(danio)
	}
}

object frontem {
	method poder(legion) {
		return legion.poder()*1.1
	}
	method recibir(danio, legion){
		legion.recibirMitad(danio)
	}
	
}