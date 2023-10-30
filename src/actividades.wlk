import socios.*

class Actividad {
    const idiomas = #{}

    method agregarIdioma(unIdioma){
        idiomas.add(unIdioma)
    }
        
    method quitarIdioma(unIdioma){
        idiomas.remove(unIdioma)
    }

    method idiomasUsados()

    method implicaEsfuerzo()

    method sirveParaBroncearse()

    method cantidadDias()

    method esInteresante() = idiomas.size() >= 2

    method idiomas() = idiomas

    method esRemomendada(unSocio) = self.esInteresante() and unSocio.esAtractiva(self) and not unSocio.actividades().contains(self)
}

class Playero inherits Actividad{
    const property largo

    override method cantidadDias() = largo / 500

    override method implicaEsfuerzo() = largo > 1200

    override method sirveParaBroncearse() = true
}

class Citadino inherits Actividad {
    const property atracciones

    override method cantidadDias() = atracciones / 2

    override method implicaEsfuerzo = atracciones.between(5,8)

    override method sirveParaBroncearse() = false

    override method esInteresante() = super() or atracciones == 5
}

class Tropical inherits Citadino {
    override method cantidadDias() = super() + 1

    override method sirveParaBroncearse() = true
}

class Trekking inherits Actividad {
    const property kilometros
    const property diasSol

    override method cantidadDias() = kilometros / 50

    override method implicaEsfuerzo() = kilometros > 80

    override method sirveParaBroncearse() = (diasSol > 200) or (diasSol.between(100,200) and kilometros > 120)

    override method esInteresante() = super() and diasSol > 140
}

class Gimnasia inherits Actividad {
    override method idiomas = #{"español"}
    
    override method cantidadDias() = 1

    override method implicaEsfuerzo() = true

    override method sirveParaBroncearse() = false

    override method esRemomendada(unSocio) = unSocio.edad().between(20,30)
}

class Literario inherits Actividad {
    const libros = []

    override method idiomas() = libros.map({libro => libro.idioma()}).asSet()

    override method cantidadDias() = libros.size() + 1

    override method implicaEsfuerzo() = self.hayLibroConMasDe500Pag() or self.sonTodosDelMismoAutor()

    method hayLibroConMasDe500Pag() = libros.any({libro => libro.cantidadPaginas() > 500 })

    method sonTodosDelMismoAutor = self.autores().size() == 1
    
    method autores() = libros.map({libro => libro.autor()}).asSet()

    override method sirveParaBroncearse() = false

    override esRemomendada(unSocio) = unSocio.idiomasHablados().size() > 1
}

class Libro {
    const property idioma
    const property autor
    const property cantidadPaginas
}