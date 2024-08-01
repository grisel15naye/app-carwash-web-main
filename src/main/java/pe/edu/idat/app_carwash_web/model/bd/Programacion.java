package pe.edu.idat.app_carwash_web.model.bd;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalTime;
@Getter
@Setter
@Entity
@Table(name = "programacion")
public class Programacion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer programacionid;
    private LocalDate fecha;
    private LocalTime horaprogramada;

    @ManyToOne
    @JoinColumn(name = "sedeid")
    private Sede sede;
}
