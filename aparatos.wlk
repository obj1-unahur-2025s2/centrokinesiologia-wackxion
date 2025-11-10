class Aparatos {
    
    method usarAparato(paraPaciente)

    method puedeUsarAparato(unPaciente)
}

class Magneto inherits Aparatos {

    override method usarAparato(unPaciente){
        unPaciente.alteracionDeNivelDolor(-(unPaciente.nivelDolor() * 0.1))}
    
    override method puedeUsarAparato(unPaciente) = true

}

class Bicicleta inherits Aparatos {

    override method usarAparato(unPaciente){
        if(self.puedeUsarAparato(unPaciente)){
            unPaciente.alteracionDeNivelDolor(-4)
            unPaciente.alteracionDeFortalezaMuscular(3)
        }
    }

    override method puedeUsarAparato(unPaciente) = unPaciente.edad() > 8
  
}

class Minitramp inherits Aparatos {

    override method usarAparato(unPaciente) {
        if(self.puedeUsarAparato(unPaciente)){
            unPaciente.alteracionDeFortalezaMuscular(unPaciente.edad() * 0.1)
        }
    }

    override method puedeUsarAparato(unPaciente) = unPaciente.nivelDolor() < 20
    
}