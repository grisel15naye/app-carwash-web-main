package pe.edu.idat.app_carwash_web.model.bd;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "cliente")
public class Cliente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer clienteid;
    private String nombre;
    private String apellido;
    private String tipodocumento;
    private Integer numerodocumento;
    private Integer telefono;
    private String direccion;
    private boolean estadocliente;
}
