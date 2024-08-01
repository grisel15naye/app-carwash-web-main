package pe.edu.idat.app_carwash_web.model.bd;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import pe.edu.idat.app_carwash_web.model.bd.Usuario;

import java.util.HashSet;
import java.util.Set;

@Getter @Setter
@Entity
@Table(name = "rol")
public class Rol {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idrol;
    private String nomrol;
    @ManyToMany(mappedBy = "roles")
    private Set<Usuario> usuarios = new HashSet<>();
}
