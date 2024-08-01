package pe.edu.idat.app_carwash_web.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pe.edu.idat.app_carwash_web.model.bd.Sede;
import pe.edu.idat.app_carwash_web.model.bd.Trabajador;
import pe.edu.idat.app_carwash_web.model.bd.dto.TrabajadorDto;
import pe.edu.idat.app_carwash_web.repository.TrabajadorRepository;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class TrabajadorService implements ITrabajadorService {
    private TrabajadorRepository trabajadorRepository;


    @Override
    public List<TrabajadorDto> listarTrabajador() {
        List<TrabajadorDto> trabajadorDtoList = new ArrayList<>();
        for (Trabajador trab : trabajadorRepository.findAll()) {
            TrabajadorDto.TrabajadorDtoBuilder trabajadorDtoBuilder = TrabajadorDto.builder()
                    .trabajadorid(trab.getTrabajadorid())
                    .nombre(trab.getNombre())
                    .apellido(trab.getApellido())
                    .tipodocumento(trab.getTipodocumento())
                    .numerodocumento(trab.getNumerodocumento())
                    .telefono(trab.getTelefono())
                    .direccion(trab.getDireccion())
                    .salario(trab.getSalario())
                    .fechacontratacion(trab.getFechacontratacion())
                    .estadotrab(trab.isEstadotrab());

            // Verifica si sede es null antes de intentar acceder a sus métodos
            if (trab.getSede() != null) {
                trabajadorDtoBuilder
                        .sedeid(trab.getSede().getSedeid())
                        .nombresede(trab.getSede().getNombresede());
            } else {
                // Si sede es null, puedes establecer valores predeterminados o dejar en blanco
                trabajadorDtoBuilder
                        .sedeid(null) // O algún valor predeterminado si prefieres
                        .nombresede(null); // O algún valor predeterminado si prefieres
            }

            trabajadorDtoList.add(trabajadorDtoBuilder.build());
        }
        return trabajadorDtoList;
    }
    @Override
    public void guardarTrabajador(TrabajadorDto trabajador) {
        if (trabajador.getTrabajadorid() > 0) {
            trabajadorRepository.actualizarTrabajador(
                    trabajador.getTrabajadorid(),
                    trabajador.getNombre(),
                    trabajador.getApellido(),
                    trabajador.getTipodocumento(),
                    trabajador.getNumerodocumento(),
                    trabajador.getSedeid(),
                    trabajador.getTelefono(),
                    trabajador.getDireccion(),
                    trabajador.getSalario(),
                    trabajador.getFechacontratacion(),
                    trabajador.isEstadotrab()
            );
        } else {
            Trabajador nuevoTrabajador = new Trabajador();
            nuevoTrabajador.setNombre(trabajador.getNombre());
            nuevoTrabajador.setApellido(trabajador.getApellido());
            nuevoTrabajador.setTipodocumento(trabajador.getTipodocumento());
            nuevoTrabajador.setNumerodocumento(trabajador.getNumerodocumento());
            Sede sede= new Sede();
            sede.setSedeid(trabajador.getSedeid());
            nuevoTrabajador.setSede(sede);
            nuevoTrabajador.setTelefono(trabajador.getTelefono());
            nuevoTrabajador.setDireccion(trabajador.getDireccion());
            nuevoTrabajador.setSalario(trabajador.getSalario());
            nuevoTrabajador.setFechacontratacion(trabajador.getFechacontratacion());
            nuevoTrabajador.setEstadotrab(true);
            trabajadorRepository.save(nuevoTrabajador);

        }
    }

    @Override
    public Trabajador obtenerTrabajador(Integer idtrabajador) {
        return trabajadorRepository.findById(idtrabajador).orElse(null);}
}
