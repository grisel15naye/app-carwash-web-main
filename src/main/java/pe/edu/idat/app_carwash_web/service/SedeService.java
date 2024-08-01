package pe.edu.idat.app_carwash_web.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pe.edu.idat.app_carwash_web.model.bd.Sede;
import pe.edu.idat.app_carwash_web.repository.SedeRepository;

import java.util.ArrayList;
import java.util.List;
@Service
@AllArgsConstructor
public class SedeService implements  ISedeService{
    private SedeRepository sedeRepository;


    @Override
    public List<Sede> listarSede() {
        return sedeRepository.findAll();
    }

    @Override
    public Sede guardarSede(Sede sede) {
        return sedeRepository.save(sede);
    }

    @Override
    public Sede obtenerSede(Integer idsede) {
        return sedeRepository.findById(idsede).orElse(null);
    }
}
