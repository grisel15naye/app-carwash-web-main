package pe.edu.idat.app_carwash_web.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pe.edu.idat.app_carwash_web.model.bd.Programacion;

import java.time.LocalDate;
import java.time.LocalTime;

public interface ProgramacionRepository extends JpaRepository <Programacion, Integer >{
    @Modifying
    @Transactional
    @Query(value = "UPDATE programacion SET sedeid=:sedeid, " +
            "fecha=:fecha, horaprogramada=:horaprogramada where programacionid=:programacionid ",nativeQuery = true)
    void actualizarProgramacion(@Param("programacionid") Integer programacionid,
                              @Param("sedeid")Integer sedeid,
                              @Param("fecha")LocalDate fecha,
                              @Param("horaprogramada") LocalTime horaprogramada);



}
