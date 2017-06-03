import combatientes.*

class Grupo inherits Combatiente{
	var integrantes = []
	
	override method poder(){
		return integrantes.filter{int=>not int.fueraCombate()}
			.sum{int=>int.poder()}
	}
	method recibir(danio){
		self.repartirDanio(danio)
	}
	
	method repartirDanio(danio){
		integrantes.sortBy{int=>int.poder()}
			.take(10)
			.forEach{int=>int.recibir(danio/10)}
	}
}
class Legion inherits Grupo {
	var formacion = cuadro
	const minimo = 10
	
	override method poder(){
		return formacion.poder(super())
	}
	override method recibir(danio){
		formacion.recibir(danio,self)
		if(self.poder()<minimo)
			self.formacion(tortuga)
	}
	method formacion(f){
		formacion = f
	}
	method repartirDanioMitad(danio){
		integrantes.take(integrantes.size().div(2))
			.forEach{int=>int.recibir(danio*2)}
	}
}

object tortuga{
	method poder(poder) {
		return 0
	}
	method recibir(danio, legion){}
}

object cuadro{
	method poder(poder) {
		return poder
	}
	method recibir(danio, legion) {
		legion.repartirDanio(danio)
	}
}

object frontem {
	method poder(poder) {
		return poder*1.1
	}
	method recibir(danio, legion){
		legion.repartirDanioMitad(danio)
	}
}