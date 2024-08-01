package pe.edu.idat.app_carwash_web.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.edu.idat.app_carwash_web.model.bd.Modelo;

@Repository
public interface ModeloRepository extends JpaRepository <Modelo, Integer> {
    @Modifying
    @Transactional
    @Query(value = "UPDATE modelo SET modeloinfo=:modeloinfo, " +
            "marcainfo=:marcainfo where modeloid=:modeloid ",nativeQuery = true)
    void actualizarModelo(@Param("modeloid") Integer modeloid,
                          String marcainfo, @Param("modeloinfo")Integer modeloinfo);

}
