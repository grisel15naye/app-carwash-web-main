package pe.edu.idat.app_carwash_web.service;

import pe.edu.idat.app_carwash_web.model.bd.dto.AccionesDto;

import java.util.List;

public interface IAccionService {
    List<AccionesDto> listarAcciones();
    void guardarAcciones(AccionesDto acciones);
    List<AccionesDto> obtenerAccionesPorIds(List<Integer> ids);
}
