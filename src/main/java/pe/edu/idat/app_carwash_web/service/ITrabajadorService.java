package pe.edu.idat.app_carwash_web.service;

import pe.edu.idat.app_carwash_web.model.bd.Trabajador;
import pe.edu.idat.app_carwash_web.model.bd.dto.TrabajadorDto;

import java.util.List;

public interface ITrabajadorService {
    List<TrabajadorDto> listarTrabajador();
    void guardarTrabajador(TrabajadorDto trabajador);
    Trabajador obtenerTrabajador(Integer idtrabajador);
}
