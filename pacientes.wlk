import colores.*
import aparatos.*

class Paciente {
  const edad
  var nivelFortalezaMuscular
  var nivelDolor
  const rutinaDelPaciente = [] // agregan aparatos

  method nivelFortalezaMuscular() = nivelFortalezaMuscular
  
  method nivelDolor() = nivelDolor
  
  method edad() = edad

  method puedeUsarAparato(unAparato) = unAparato.puedeUsarAparato(self)

  method usarAparato(unAparato) {if(self.puedeUsarAparato(unAparato)){unAparato.usarAparato(self)}}

  method alteracionDeNivelDolor(nuevoNivel) { nivelDolor = nivelDolor + nuevoNivel}

  method alteracionDeFortalezaMuscular(nuevoNivel) { nivelFortalezaMuscular = nivelFortalezaMuscular + nuevoNivel}

// rutina

  method rutinaDelPaciente() = rutinaDelPaciente

  method agregarAparatoALaRutina(unAparato) { rutinaDelPaciente.add(unAparato)}

  method removerAparatoDeLaRutina(unAparato) { rutinaDelPaciente.remove(unAparato)}

  method borrarRutina(){rutinaDelPaciente.clear()}

  method puedehacerLaRutina() = rutinaDelPaciente.all({a => self.puedeUsarAparato(a)})

  method hacerRutina() {if(self.puedehacerLaRutina()){
    rutinaDelPaciente.forEach({a => self.usarAparato(a)})
  }}

}

class Resistente inherits Paciente {
  var aparatosUsados = 0

  method reiniciarContador() {aparatosUsados = 0}

  method recistencia() {nivelFortalezaMuscular = nivelFortalezaMuscular + aparatosUsados}

  override method hacerRutina() {
    if(self.puedehacerLaRutina()){
      rutinaDelPaciente.forEach({a => self.usarAparato(a) aparatosUsados += 1})
      self.recistencia()
      self.reiniciarContador()
  }}
}


class Caprichoso inherits Paciente {
  override method puedehacerLaRutina() = super() and rutinaDelPaciente.any({a => a.color() == "rojo"})
}

class RapidaRecuperacion inherits Paciente {
  override method hacerRutina() {
    super()
    self.recuperacionBruta()
  }

  method recuperacionBruta() {if(self.nivelDolor() > indoloro.dolor()){nivelDolor = nivelDolor - indoloro.dolor()}}
}


object indoloro {
   var dolor = 3

   method dolor() = dolor
   method modificacionDeDolor(nuevoDolor) {dolor = nuevoDolor}
}