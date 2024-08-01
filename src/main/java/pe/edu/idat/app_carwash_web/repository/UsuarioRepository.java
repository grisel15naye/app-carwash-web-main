package pe.edu.idat.app_carwash_web.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.edu.idat.app_carwash_web.model.bd.Usuario;

@Repository
public interface UsuarioRepository
        extends JpaRepository<Usuario, Integer> {

    /*SELECT * FROM USUARIO WHERE NOMUSUARIO = @Parametro and Estado = @Parametro2
    Usuario findByNomusuarioAndActivo(String nomusuario, boolean estado);
    */
    Usuario findByNomusuario(String nomusuario);

    @Transactional
    @Modifying
    @Query(value = "UPDATE usuario SET nombres =:nombres, " +
            "apellidos =:apellidos, activo =:activo where " +
            "idusuario =:idusuario",nativeQuery = true)
    void actualizarUsuario(@Param("nombres") String nombres,
                           @Param("apellidos") String apellidos,
                           @Param("activo") boolean activo,
                           @Param("idusuario") Integer idusuario);

}
