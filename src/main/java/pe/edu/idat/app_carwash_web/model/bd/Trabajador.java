package pe.edu.idat.app_carwash_web.model.bd;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "trabajador")
public class Trabajador {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer trabajadorid;
    private String nombre;
    private String apellido;
    private String tipodocumento;
    private Integer numerodocumento;
    private Integer telefono;
    private String direccion;
    private Double salario;
    private LocalDate fechacontratacion;
    private boolean estadotrab;

    @ManyToOne
    @JoinColumn(name = "sedeid")
    private Sede sede;

}
