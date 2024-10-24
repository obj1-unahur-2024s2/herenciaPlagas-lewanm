class Plaga{
    const poblacion

    method transmiteEnfermedades(){
        return poblacion >= 10
    }

    method nivelDeDanio(){}
}

class PlagaDeCucarachas inherits Plaga{
    const pesoPromedio

    override method transmiteEnfermedades(){
        return super() and pesoPromedio >= 10
    }

    override method nivelDeDanio(){
        return poblacion * 0.5
    }
}

class PlagaDePulgas inherits Plaga{
    override method nivelDeDanio(){
        return poblacion * 2
    }
}

class PlagaDeGarrapatas inherits PlagaDePulgas{

}

class PlagaDeMosquitos inherits Plaga{
    override method nivelDeDanio() = poblacion
    override method transmiteEnfermedades(){
        return super() and poblacion % 3 == 0
    }
}