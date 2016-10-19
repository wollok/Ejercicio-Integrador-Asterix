/**
 * This is an example wollok hello world
 */

class Pocion{
	var ingredientes = []
	
	method esTomada(galo) {
		ingredientes.forEach{ing=>ing.afecta(galo)}
	}
}

object dulceDeLeche{
	
	method afecta(alguien) {
		alguien.aumentaFuerza(10)
		alguien.alteraResistencia()
	}
}

class Aceite {
	var dosis
	
	constructor(d){
		dosis = d
	}
	
	method afecta(alguien) {
		alguien.multiplicaFueza(dosis)
	}
}

class Zumo inherits Aceite {
	
	constructor(d) = super(d)
	
	override method afecta(alguien){
		super(alguien)
		alguien.aumentaResistencia()
	}
}


class Peleador {
	method pelear(otro){
		otro.recibir(self.poder())
	}
	method poder()
}

class Galo inherits Peleador{
	var fuerza
	var resistencia
	
	constructor(f, r){
		fuerza = f
		resistencia = r
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
}

class Grupo inherits Peleador{
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