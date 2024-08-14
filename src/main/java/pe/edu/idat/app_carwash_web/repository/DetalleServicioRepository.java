package pe.edu.idat.app_carwash_web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pe.edu.idat.app_carwash_web.model.bd.DetalleServicio;
import pe.edu.idat.app_carwash_web.model.bd.pk.TipoAccionesId;

public interface DetalleServicioRepository extends JpaRepository<DetalleServicio, TipoAccionesId> {
}

