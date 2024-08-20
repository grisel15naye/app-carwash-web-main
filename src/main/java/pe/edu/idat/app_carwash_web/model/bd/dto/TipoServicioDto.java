package pe.edu.idat.app_carwash_web.model.bd.dto;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class TipoServicioDto {
    private Integer tiposervicioid;
    private String descripciontps;
    private String tipovehiculo;
    private Boolean estadotps;
    private List<AccionesDto> acciones;

}
