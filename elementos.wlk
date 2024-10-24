class Elemento{
    method esBueno(){}
}

class Hogar inherits Elemento{
    const mugre
    const confort

    override method esBueno() = mugre * 0.5 <= confort
}

class Huerta inherits Elemento{
    const capacidadDeProduccion
    const nivelProduccion

    override method esBueno() = capacidadDeProduccion > nivelProduccion
}

class Mascota inherits Elemento{
    const salud
    
    override method esBueno() = salud > 250
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