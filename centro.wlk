object centrokinesiologia {
  const aparatosDisponibles = []
  const pacientesRegistrados = []

  method coloresDeAparatos() = aparatosDisponibles.map({a => a.color()}).distinct()

  method pacienteMenoresOchoAños() = pacientesRegistrados.filter({p => p.edad() < 8})

  method pacientesNoPuedenHacerRutina() = pacientesRegistrados.filter({p => not p.puedehacerLaRutina()})

  method estaOptimasCondiciones() = aparatosDisponibles.all({a => not a.necesitaMantenimiento()})
 
  method estaComplicado() = self.cantidadAparatosConMantenimiento() >= self.cantidadAparatosDisponibles().div(2)

  method cantidadAparatosConMantenimiento() = aparatosDisponibles.filter({a => a.necesitaMantenimiento()}).size()

  method cantidadAparatosDisponibles() = aparatosDisponibles.size()

  method aparatosNecesitanMantenimiento() = aparatosDisponibles.filter({a => a.necesitaMantenimiento()})

  method visitaUnTecnico() = self.aparatosNecesitanMantenimiento().forEach({a => a.Mantenimiento()})
 
 }