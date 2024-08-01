package pe.edu.idat.app_carwash_web.model.bd.dto;

import lombok.Data;

@Data
public class UsuarioRequest {
    private Integer idusuario;
    private String nomusuario;
    private String nombres;
    private String apellidos;
    private Boolean activo;
    private String email;
}
