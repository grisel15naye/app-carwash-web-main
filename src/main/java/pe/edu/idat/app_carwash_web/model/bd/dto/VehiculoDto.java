package pe.edu.idat.app_carwash_web.model.bd.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class VehiculoDto {
    private Integer vehiculoid;
    private String placa;
}
