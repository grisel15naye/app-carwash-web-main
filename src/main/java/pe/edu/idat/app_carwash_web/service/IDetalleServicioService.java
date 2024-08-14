package pe.edu.idat.app_carwash_web.service;

import pe.edu.idat.app_carwash_web.model.bd.DetalleServicio;
import pe.edu.idat.app_carwash_web.model.bd.pk.TipoAccionesId;

public interface IDetalleServicioService {
    DetalleServicio guardarDetalleServicio(DetalleServicio detalleServicio);
    void eliminarDetalleServicio(TipoAccionesId id);
}
