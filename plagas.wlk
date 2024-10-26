class Plaga{
    var poblacion

    method transmiteEnfermedades(){
        return poblacion >= 10
    }

    method nivelDeDanio(){}

    method atacar(elemento){
        elemento.afectar(self)
        self.aumentarPoblacion()
    }

    method aumentarPoblacion(){
        poblacion += poblacion * 0.1
    }
}

class PlagaDeCucarachas inherits Plaga{
    var pesoPromedio

    override method transmiteEnfermedades(){
        return super() and pesoPromedio >= 10
    }

    override method nivelDeDanio(){
        return poblacion * 0.5
    }

    override method atacar(elemento){
        super(elemento)
        pesoPromedio += 2
    }
}

class PlagaDePulgas inherits Plaga{
    override method nivelDeDanio(){
        return poblacion * 2
    }
}

class PlagaDeGarrapatas inherits PlagaDePulgas{
    override method aumentarPoblacion(){
        super() * 2
    }
}

class PlagaDeMosquitos inherits Plaga{
    override method nivelDeDanio() = poblacion
    override method transmiteEnfermedades(){
        return super() and poblacion % 3 == 0
    }
}