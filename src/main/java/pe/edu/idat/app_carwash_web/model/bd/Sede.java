package pe.edu.idat.app_carwash_web.model.bd;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalTime;
import java.util.Date;
@Getter
@Setter
@Entity
@Table(name = "sede")
public class Sede {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sedeid;
    private String nombresede;
    private String sedeinfo;
    private String dia;
    private LocalTime horaabierto;
    private LocalTime horacierre;
    private boolean estadosede;
}
