package pe.edu.idat.app_carwash_web.service;

import pe.edu.idat.app_carwash_web.model.bd.Acciones;
import pe.edu.idat.app_carwash_web.model.bd.dto.AccionesDto;

import java.util.List;

import java.util.List;
import java.util.Optional;

public interface IAccionService {
    List<AccionesDto> listarAcciones();
    void guardarAcciones(AccionesDto acciones);
    Acciones obtenerAcciones(Integer idacciones);


}
