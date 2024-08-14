package pe.edu.idat.app_carwash_web.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pe.edu.idat.app_carwash_web.model.bd.DetalleServicio;
import pe.edu.idat.app_carwash_web.model.bd.pk.TipoAccionesId;
import pe.edu.idat.app_carwash_web.repository.DetalleServicioRepository;

@AllArgsConstructor
@Service
public class DetalleServicioService implements IDetalleServicioService {
    private final DetalleServicioRepository detalleServicioRepository;

    @Override
    public DetalleServicio guardarDetalleServicio(DetalleServicio detalleServicio) {
        return detalleServicioRepository.save(detalleServicio);
    }

    @Override
    public void eliminarDetalleServicio(TipoAccionesId id) {
        if (detalleServicioRepository.existsById(id)) {
            detalleServicioRepository.deleteById(id);
        } else {
            throw new RuntimeException("Detalle de Servicio no encontrado");
        }
    }
}
