package pe.edu.idat.app_carwash_web.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.edu.idat.app_carwash_web.model.bd.Sede;

import java.time.LocalTime;

@Repository
public interface SedeRepository extends JpaRepository<Sede,Integer> {
    @Modifying
    @Transactional
    @Query(value = "UPDATE sede SET nombresede=:nombresede, sedeinfo=:sedeinfo, " +
            "lunes=:lunes, martes=:martes, miercoles=:miercoles, jueves=:jueves, " +
            "viernes=:viernes, sabado=:sabado, domingo=:domingo, horaabierto=:horaabierto, " +
            "horacierre=:horacierre, estadosede=:estadosede, where sedeid=:sedeid ",nativeQuery = true)
    void actualizarSede(@Param("sedeid") Integer sedeid,
                        @Param("nombresede")String nombresede,
                        @Param("sedeinfo")String sedeinfo,
                        @Param("lunes")boolean lunes,
                        @Param("martes")boolean martes,
                        @Param("miercoles")boolean miercoles,
                        @Param("jueves")boolean jueves,
                        @Param("viernes")boolean viernes,
                        @Param("sabado")boolean sabado,
                        @Param("domingo")boolean domingo,
                        @Param("horaabierto")LocalTime horaabierto,
                        @Param("horacierre")LocalTime horacierre,
                        @Param("estadosede")boolean estadosede);

}
