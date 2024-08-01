package pe.edu.idat.app_carwash_web.model.bd.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class RespuestaGeneral {
    private boolean resultado;
    private String mensaje;
}
