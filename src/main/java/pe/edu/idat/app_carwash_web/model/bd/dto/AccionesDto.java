package pe.edu.idat.app_carwash_web.model.bd.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class AccionesDto {
    private Integer accionesid;
    private String descripcion;
    private Double precio;
    private boolean estadoacc;
}
