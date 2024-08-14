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
@Table(name="tipo_servicio")
public class TipoServicio {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer tiposervicioID;
    private String descripciontps;
    private String tipovehiculo;
    private Boolean estadotps;
    @Transient
    private double totalAccionesPrecio;
    @OneToMany(mappedBy = "tiposervicio",
    cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    private Set<DetalleServicio> acciones = new HashSet<>();


}
