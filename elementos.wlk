import plagas.*

class Elemento{
    method esBueno(){}
    method afectar(plagaQueAfecta){}
}

class Hogar inherits Elemento{
    var mugre
    const confort

    override method esBueno() = mugre * 0.5 <= confort
    override method afectar(plaga){
        mugre += plaga.nivelDeDanio()
    }
}

class Huerta inherits Elemento{
    var capacidadDeProduccion
    const nivelProduccion

    override method esBueno() = capacidadDeProduccion > nivelProduccion
    override method afectar(plaga){

        const calculoDanio = if (plaga.transmiteEnfermedades()) {plaga.nivelDeDanio() * 0.1 + 10} else {plaga.nivelDeDanio() * 0.1}
        capacidadDeProduccion = 0.max(capacidadDeProduccion - calculoDanio)
    }
}

class Mascota inherits Elemento{
    var salud
    
    override method esBueno() = salud > 250
    override method afectar(plaga){
        if(plaga.transmiteEnfermedades()){
            self.disminuirVida(plaga.nivelDeDanio())
        }
    }

    method disminuirVida(cantidad){
        salud = 0.max(salud - cantidad)
    }
}

class Barrio{
    const elementos = []

    //Saber si un barrio es copado, la condición es que tenga más elementos buenos que no-buenos.
    method esCopado(){
        self.elementosMalos().size() < self.elementosBuenos().size()
    }

    method elementosMalos(){
        return elementos.filter({ele => !ele.esBueno()})
    }

    method elementosBuenos(){
        return elementos.filter({ele => ele.esBueno()})
    }
}