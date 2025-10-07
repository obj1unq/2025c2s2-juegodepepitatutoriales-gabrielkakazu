import wollok.game.*
import pepita.*
import extras.*
import comidas.*

object randomizer {

	method position() {
		return game.at( 
			0.randomUpTo(game.width()-1).truncate(0),
			0.randomUpTo(game.height()-1).truncate(0)
		) 
	}
	
	method emptyPosition() {
		const position = self.position()
		if (game.getObjectsIn(position).isEmpty()) {
			return position	
		}
		else {
			return self.emptyPosition()
		}
	}

	method cantidadComidas() {
		return game.allVisuals().count(
			{ visual => 
			visual.esAlpiste() or visual.esManzana()
			}
		)
	}

	method comidaAleatoria() {
		game.onTick(3000, "comida Random", {
//			if (self.cantidadComidas() < 3)
			if (game.allVisuals().size()<8){
				comidaRandom.crear()
			}
		})
	}



}

