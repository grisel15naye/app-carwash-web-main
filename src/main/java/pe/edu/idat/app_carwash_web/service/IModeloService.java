package pe.edu.idat.app_carwash_web.service;

import pe.edu.idat.app_carwash_web.model.bd.Modelo;
import pe.edu.idat.app_carwash_web.model.bd.dto.ModeloDto;

import java.util.List;

public interface IModeloService {
    List<ModeloDto> listarModelo();
    void guardarModelo(ModeloDto modelo);
    Modelo obtenerModelo(Integer idmodelo);
}
