package pe.edu.idat.app_carwash_web.model.bd.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class ModeloDto {
    private Integer modeloid;
    private String modeloinfo;
    private Integer marcaid;
    private String marcainfo;

}
