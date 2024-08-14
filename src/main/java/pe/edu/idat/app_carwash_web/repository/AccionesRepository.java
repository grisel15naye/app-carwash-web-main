package pe.edu.idat.app_carwash_web.repository;


import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.edu.idat.app_carwash_web.model.bd.Acciones;
import pe.edu.idat.app_carwash_web.model.bd.Cliente;

@Repository
public interface AccionesRepository extends JpaRepository<Acciones, Integer> {
    @Modifying
    @Transactional
    @Query(value = "UPDATE acciones SET descripcion=:descripcion, " +
            "precio=:precio, estadoacc=:estadoacc " +
            "WHERE accionesid=:accionesid", nativeQuery = true)
    void actualizarAcciones(@Param("accionesid") Integer accionesID,
                            @Param("descripcion") String descripcion,
                            @Param("precio") Double precio,
                            @Param("estadoacc") boolean estadoacc);
}
