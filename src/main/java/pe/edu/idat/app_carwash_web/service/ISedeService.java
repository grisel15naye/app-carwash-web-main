package pe.edu.idat.app_carwash_web.service;

import pe.edu.idat.app_carwash_web.model.bd.Sede;

import java.util.List;

public interface ISedeService {
    List<Sede> listarSede();
    Sede guardarSede(Sede sede);
    Sede obtenerSede (Integer idsede);

}
