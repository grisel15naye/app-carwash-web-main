package pe.edu.idat.app_carwash_web.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.edu.idat.app_carwash_web.model.bd.Cliente;

@Repository
public interface ClienteRepository extends JpaRepository <Cliente,Integer> {
    @Query(value = "UPDATE cliente SET nombre=:nombre, apellido=:apellido, " +
            "tipodocumento=:tipodocumento, numerodocumento=:numerodocumento, " +
            "telefono=:telefono, direccion=:direccion, estadocliente=:estadocliente where clienteid=:clienteid ",nativeQuery = true)
    void actualizarCliente(@Param("clienteid") Integer clienteid,
                              @Param("nombre")String nombre,
                              @Param("apellido")String apellido,
                              @Param("tipodocumento")String tipodocumento,
                              @Param("numerodocumento")Integer numerodocumento,
                              @Param("telefono") Integer telefono,
                              @Param("direccion")String direccion,
                              @Param("estadocliente")boolean estadocliente);
}
