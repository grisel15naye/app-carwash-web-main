package pe.edu.idat.app_carwash_web.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pe.edu.idat.app_carwash_web.model.bd.TipoServicio;
import pe.edu.idat.app_carwash_web.repository.TipoServicioRepository;

import java.util.List;

@Service
@AllArgsConstructor
public class TipoServicioService implements ITipoServicioService{
    private TipoServicioRepository tipoServicioRepository;

    @Override
    public List<TipoServicio> listarTipoServicios() {return tipoServicioRepository.findAll();}

    @Override
    public TipoServicio guardarTipoServicio(TipoServicio tipoServicio) {return tipoServicioRepository.save(tipoServicio);}

    @Override
    public TipoServicio obtenerTipoServicio(Integer idtiposervicio) {
        return tipoServicioRepository.findById(idtiposervicio).orElse(null);
    }

}


