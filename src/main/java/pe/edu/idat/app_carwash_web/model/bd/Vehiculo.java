package pe.edu.idat.app_carwash_web.model.bd;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "vehiculo")
public class Vehiculo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer vehiculoid;
    private String placa;
    @ManyToOne
    @JoinColumn(name = "marcaid")
    private Marca marca;
}
