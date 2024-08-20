package pe.edu.idat.app_carwash_web.model.bd.dto;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class TipoServicioRequest {
    private String descripciontps;
    private String tipovehiculo;
    private boolean estadotps;
    private List<Integer> acciones;
}
