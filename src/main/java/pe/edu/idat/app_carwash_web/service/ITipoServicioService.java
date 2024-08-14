package pe.edu.idat.app_carwash_web.service;

import pe.edu.idat.app_carwash_web.model.bd.TipoServicio;

import java.util.List;
import java.util.Optional;

public interface ITipoServicioService {
    List<TipoServicio> listarTipoServicios();
    TipoServicio guardarTipoServicio(TipoServicio tipoServicio);
    TipoServicio obtenerTipoServicio(Integer idtiposervicio);
}
