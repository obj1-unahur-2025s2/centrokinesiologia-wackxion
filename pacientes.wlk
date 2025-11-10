class Paciente {
  const edad
  var nivelFortalezaMuscular
  var nivelDolor

  method nivelFortalezaMuscular() = nivelFortalezaMuscular
  
  method nivelDolor() = nivelDolor
  
  method edad() = edad

  method puedeUsarAparato(unAparato) = unAparato.puedeUsarAparato(self)

  method usarAparato(unAparato) {if(self.puedeUsarAparato(unAparato)){unAparato.usarAparato(self)}}

  method alteracionDeNivelDolor(nuevoNivel) { nivelDolor = nivelDolor + nuevoNivel}

  method alteracionDeFortalezaMuscular(nuevoNivel) { nivelFortalezaMuscular = nivelFortalezaMuscular + nuevoNivel}
}