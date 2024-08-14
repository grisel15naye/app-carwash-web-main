package pe.edu.idat.app_carwash_web.model.bd.pk;

import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
@Getter
@Setter
@Embeddable
public class TipoAccionesId implements Serializable {
    private Integer accionesid;
    private Integer tiposervicioid;
}
