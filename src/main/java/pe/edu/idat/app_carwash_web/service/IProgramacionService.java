package pe.edu.idat.app_carwash_web.service;

import pe.edu.idat.app_carwash_web.model.bd.Programacion;
import pe.edu.idat.app_carwash_web.model.bd.dto.ProgramacionDto;

import java.util.List;

public interface IProgramacionService {
    List<ProgramacionDto>listarProgramacion();
    void guardarProgramacion(ProgramacionDto programacion);
    Programacion obtenerProgramacion(Integer idprogramacion);

}
