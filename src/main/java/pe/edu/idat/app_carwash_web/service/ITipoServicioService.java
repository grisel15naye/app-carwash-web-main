package pe.edu.idat.app_carwash_web.service;

import pe.edu.idat.app_carwash_web.model.bd.TipoServicio;
import pe.edu.idat.app_carwash_web.model.bd.dto.TipoServicioDto;

import java.util.List;

public interface ITipoServicioService {
    List<TipoServicioDto> listarTipoServicio();
    void guardarTipoServicio(TipoServicioDto tipoServicioDto);

    void actualizarTipoServicio(TipoServicioDto tipoServicioDto);

    TipoServicio obtenerTipoServicio(Integer idtiposervicio);
}
