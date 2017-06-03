import combatientes.*
import pociones.*

object fixture{
	
	method crearAsterix() {
		return new Persona(10,10)
	}
	method crearPocionMagica(){
		const pocion = new Pocion()
		pocion.agregarIngrediente(dulceDeLeche)
		pocion.agregarIngrediente(new Manojo(5))
		pocion.agregarIngrediente(new Aceite(2))
		return pocion
	}
	method crearPocionMagicaReforzada(){
		const pocion = self.crearPocionMagica()
		pocion.agregarIngrediente(new Zumo(2))
		return pocion
	}
}

