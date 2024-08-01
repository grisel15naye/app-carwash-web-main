package pe.edu.idat.app_carwash_web.model.bd.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;
import java.util.Date;

@Builder
@Data
public class TrabajadorDto {
    private Integer trabajadorid;
    private String nombre;
    private String apellido;
    private String tipodocumento;
    private Integer numerodocumento;
    private Integer sedeid;
    private String nombresede;
    private Integer telefono;
    private String direccion;
    private Double salario;
    private LocalDate fechacontratacion;
    private boolean estadotrab;

}
