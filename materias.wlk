class Carrera{
    const property materiasDe = #{}
    const property inscriptos = #{}

    method inscribirAlumno(alumno){
        validadorInscripcion.estaInscripto(inscriptos, alumno)
        inscriptos.add(alumno)
        alumno.inscribirAMateria(self)
    }
}

class Materia{
    const property curso = #{} //inscriptos

    method inscribirAlumno(alumno){
        validadorInscripcion.estaInscripto(curso, alumno)
        curso.add(alumno)
        alumno.inscribirAMateria(self)
    }

}

class Estudiante{
    const property carreras = #{}
    const property inscripciones = #{} 
    const property notas = new Dictionary()
    const property aprobadas = #{} //notas.filter({materia, nota => nota >= 4}).map({materia, nota => materia})
    
    method inscribirACarrera(carrera){
        validadorInscripcion.estaInscripto(carreras, carrera)
        carreras.add(carrera)
    }

    method inscribirAMateria(materia){
        validadorInscripcion.estaInscripto(inscripciones, materia)
        inscripciones.add(materia)
    }

    method cantAprobadas(){
        return aprobadas.size()
    }

    method estaAprobada(materia){
        return aprobadas.any(materia)
    }

    method ponerNotaMateria(materia, nota){
        notas.put(materia, nota)
        if(nota>=4){self.aprobarMateria(materia)}
    }

    method aprobarMateria(materia){
        self.validadorAprobada(materia)
        aprobadas.add(materia)
    }

    method validadorAprobada(materia){
        if(self.estaAprobada(materia)){
            self.error("Ya está aprobada!")
        }
    }

    method promedio(){
        return notas.values().avg()
    }
}

object validadorInscripcion{
    method estaInscripto(lista, elemento){
        if (lista.any(elemento)){
            self.error("Ya estas inscripto!")
        }
    }
}

/*class Nota{
    const property materia = null
    const property nota = null

    method esMateria() = materia
} */
