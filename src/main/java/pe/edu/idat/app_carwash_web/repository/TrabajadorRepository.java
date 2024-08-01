package pe.edu.idat.app_carwash_web.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.edu.idat.app_carwash_web.model.bd.Trabajador;

import java.time.LocalDate;
import java.util.Date;

@Repository

public interface TrabajadorRepository extends JpaRepository <Trabajador, Integer> {
    @Modifying
    @Transactional
    @Query(value = "UPDATE trabajador SET nombre=:nombre, apellido=:apellido, " +
            "tipodocumento=:tipodocumento, numerodocumento=:numerodocumento, " +
            "sedeid=:sedeid, telefono=:telefono, direccion=:direccion, salario=:salario," +
            " fechacontratacion=:fechacontratacion, estadotrab=:estadotrab where trabajadorid=:trabajadorid ",nativeQuery = true)
    void actualizarTrabajador(@Param("trabajadorid") Integer trabajadorid,
                        @Param("nombre")String nombre,
                        @Param("apellido")String apellido,
                        @Param("tipodocumento")String tipodocumento,
                        @Param("numerodocumento")Integer numerodocumento,
                        @Param("sedeid")Integer sedeid,
                        @Param("telefono") Integer telefono,
                        @Param("direccion")String direccion,
                        @Param("salario")Double salario,
                        @Param("fechacontratacion") LocalDate fechacontratacion,
                        @Param("estadotrab")boolean estadotrab);

}


