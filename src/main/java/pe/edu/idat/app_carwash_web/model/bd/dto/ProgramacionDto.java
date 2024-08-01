package pe.edu.idat.app_carwash_web.model.bd.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalTime;

@Builder
@Data
public class ProgramacionDto {
    private Integer programacionid;
    private Integer sedeid;
    private String nombresede;
    private LocalDate fecha;
    private LocalTime horaprogramada;

}

