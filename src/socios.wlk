import actividades.*

class Socio {
    const idiomasHablados = []
    const actividades = []
    var property edad
    var maximoDeActividades

    method agregarActividad(unaActividad){
        if(actividades.size() == maximoDeActividades){
            self.error("Llego al maximo de actividades permitidas")
        }
        actividades.add(unaActividad)
    }

    method esAdoradorDelSol() = actividades.all({actividad => actividad.sirveParaBroncearse()})

    method actividadesEsforzadas() = actividades.filter({actividad => actividad.implicaEsfuerzo()})

    method esAtractiva(unaActividad)

    method actividades() = actividades

    method idiomasHablados() = idiomasHablados
}

class Tranquilo inherits Socio {
    override method esAtractiva(unaActividad) = unaActividad.cantidadDias() >= 4
}

class Coherente inherits Socio {
    override method esAtractiva(unaActividad) = if(self.esAdoradorDelSol()){unaActividad.sirveParaBroncearse()}else{unaActividad.implicaEsfuerzo()}
}

class Relajado inherits Socio {
    override method esAtractiva(unaActividad) = idiomasHablados.any({idioma => unaActividad.idiomas().contains(idioma)})
}