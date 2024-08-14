package pe.edu.idat.app_carwash_web.model.bd;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "acciones")
public class Acciones {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer accionesid;
    private String descripcion;
    private Double precio;
    private boolean estadoacc;
    @OneToMany(mappedBy = "acciones",
    cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    private Set<DetalleServicio> tiposervicio = new HashSet<>();
}
