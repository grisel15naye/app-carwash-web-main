package pe.edu.idat.app_carwash_web.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.edu.idat.app_carwash_web.model.bd.TipoServicio;
import pe.edu.idat.app_carwash_web.model.bd.dto.TipoServicioDto;

@Repository
public interface TipoServicioRepository extends JpaRepository<TipoServicio, Integer> {
    @Modifying
    @Transactional
    @Query(value = "UPDATE tiposervicio SET descripciontps=:descripciontps, tipovehiculo=:tipovehiculo, estadotps=:estadotps WHERE tiposervicioid=:tiposervicioid", nativeQuery = true)
    void actualizarTipoServicio(@Param("tiposervicioid") Integer tiposervicioid,
                                @Param("descripciontps") String descripciontps,
                                @Param("tipovehiculo") String tipovehiculo,
                                @Param("estadotps") Boolean estadotps);


}
