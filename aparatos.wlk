import colores.*
import pacientes.*



class Aparatos {
    const color 

    method color() = color
    
    method usarAparato(paraPaciente)

    method puedeUsarAparato(unPaciente)

    method Mantenimiento()

    method necesitaMantenimiento()

}

class Magneto inherits Aparatos {

    var puntosDeImantacion = 800

    method puntosDeImantacion() = puntosDeImantacion

    override method necesitaMantenimiento() = puntosDeImantacion < 100

    override method Mantenimiento() {if(self.necesitaMantenimiento()){puntosDeImantacion = puntosDeImantacion + 500}}

    method desgaste() {puntosDeImantacion = puntosDeImantacion - 1}

    override method usarAparato(unPaciente){
        unPaciente.alteracionDeNivelDolor(-(unPaciente.nivelDolor() * 0.1))
        self.desgaste()}
    
    override method puedeUsarAparato(unPaciente) = true

}

class Bicicleta inherits Aparatos {

    var cantidadDesajustanTornillos = 0
    var cantidadPierdeAceite = 0

    method cantidadDesajustanTornillos() = cantidadDesajustanTornillos
    method cantidadPierdeAceite() = cantidadPierdeAceite

    override method necesitaMantenimiento() = (cantidadDesajustanTornillos >= 10) or (cantidadPierdeAceite >= 5)

    override method Mantenimiento() {
        cantidadDesajustanTornillos = 0
        cantidadPierdeAceite = 0
    }

    method desgastePerdidadDeAcite(unPaciente) {if(unPaciente.nivelDolor() > 30 and unPaciente.edad().between(30, 50)){
        cantidadPierdeAceite = cantidadPierdeAceite + 1}}

    method desgasteTornillos(unPaciente) {if(unPaciente.nivelDolor() > 30 ){
        cantidadDesajustanTornillos = cantidadDesajustanTornillos + 1}}

    override method usarAparato(unPaciente){
        if(self.puedeUsarAparato(unPaciente)){
            self.desgasteTornillos(unPaciente)
            self.desgastePerdidadDeAcite(unPaciente)
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

    override method Mantenimiento() = true

    override method necesitaMantenimiento() = false
   
}