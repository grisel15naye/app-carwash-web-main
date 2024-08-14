package pe.edu.idat.app_carwash_web.model.bd;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import pe.edu.idat.app_carwash_web.model.bd.pk.TipoAccionesId;

@Getter
@Setter
@Entity
@Table(name = "detalle_tipo_servicio")
public class DetalleServicio {
    @EmbeddedId
    private TipoAccionesId id;

    @ManyToOne
    @MapsId("accionesid")
    @JoinColumn(name = "accionesid")
    @JsonBackReference
    private Acciones acciones;

    @ManyToOne
    @MapsId("tiposervicioid")
    @JoinColumn(name = "tiposervicioid")
    @JsonBackReference
    private TipoServicio tiposervicio;

}
