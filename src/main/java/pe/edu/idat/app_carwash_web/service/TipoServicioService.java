package pe.edu.idat.app_carwash_web.service;

import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pe.edu.idat.app_carwash_web.model.bd.Acciones;
import pe.edu.idat.app_carwash_web.model.bd.DetalleServicio;
import pe.edu.idat.app_carwash_web.model.bd.TipoServicio;
import pe.edu.idat.app_carwash_web.model.bd.dto.AccionesDto;
import pe.edu.idat.app_carwash_web.model.bd.dto.TipoServicioDto;
import pe.edu.idat.app_carwash_web.model.bd.pk.TipoAccionesId;
import pe.edu.idat.app_carwash_web.repository.AccionesRepository;
import pe.edu.idat.app_carwash_web.repository.TipoServicioRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class TipoServicioService implements ITipoServicioService {
    private TipoServicioRepository tipoServicioRepository;
    private AccionesRepository accionesRepository;


    @Override
    public List<TipoServicioDto> listarTipoServicio() {
        List<TipoServicioDto> tipoServicioDtoList = new ArrayList<>();
        for (TipoServicio tipoServicio : tipoServicioRepository.findAll()) {
            TipoServicioDto tipoServicioDto = TipoServicioDto.builder()
                    .tiposervicioid(tipoServicio.getTiposervicioid())
                    .descripciontps(tipoServicio.getDescripciontps())
                    .tipovehiculo(tipoServicio.getTipovehiculo())
                    .estadotps(tipoServicio.getEstadotps())
                    .acciones(tipoServicio.getAcciones().stream()
                            .map(accion -> AccionesDto.builder()
                                    .accionesid(accion.getId().getAccionesid())
                                    .descripcion(accion.getAcciones().getDescripcion())
                                    .precio(accion.getAcciones().getPrecio())
                                    .estadoacc(accion.getAcciones().isEstadoacc())
                                    .build())
                            .collect(Collectors.toList()))
                    .build();
            tipoServicioDtoList.add(tipoServicioDto);
        }
        return tipoServicioDtoList;
    }


    @Override
    @Transactional
    public void guardarTipoServicio(TipoServicioDto tipoServicioDto) {
        TipoServicio tipoServicio = new TipoServicio();
        tipoServicio.setDescripciontps(tipoServicioDto.getDescripciontps());
        tipoServicio.setTipovehiculo(tipoServicioDto.getTipovehiculo());
        tipoServicio.setEstadotps(tipoServicioDto.getEstadotps());

        // Asignar las acciones al tipo de servicio a través de DetalleServicio
        Set<DetalleServicio> detalleServicios = tipoServicioDto.getAcciones().stream()
                .map(accionesDto -> {
                    Acciones accion = accionesRepository.findById(accionesDto.getAccionesid())
                            .orElseThrow(() -> new IllegalArgumentException("Acción no encontrada: " + accionesDto.getAccionesid()));

                    DetalleServicio detalleServicio = new DetalleServicio();

                    // Crear y configurar TipoAccionesId
                    TipoAccionesId tipoAccionesId = new TipoAccionesId();
                    tipoAccionesId.setAccionesid(accion.getAccionesid());
                    tipoAccionesId.setTiposervicioid(tipoServicio.getTiposervicioid());

                    detalleServicio.setId(tipoAccionesId);
                    detalleServicio.setAcciones(accion);
                    detalleServicio.setTiposervicio(tipoServicio);

                    return detalleServicio;
                })
                .collect(Collectors.toSet());

        tipoServicio.setAcciones(detalleServicios);

        // Guardar el tipo de servicio
        tipoServicioRepository.save(tipoServicio);
    }
    @Override
    @Transactional
    public void actualizarTipoServicio(TipoServicioDto tipoServicioDto) {
        TipoServicio tipoServicio = tipoServicioRepository.findById(tipoServicioDto.getTiposervicioid())
                .orElseThrow(() -> new IllegalArgumentException("TipoServicio no encontrado: " + tipoServicioDto.getTiposervicioid()));

        // Actualizar los datos del TipoServicio
        tipoServicio.setDescripciontps(tipoServicioDto.getDescripciontps());
        tipoServicio.setTipovehiculo(tipoServicioDto.getTipovehiculo());
        tipoServicio.setEstadotps(tipoServicioDto.getEstadotps());

        // Limpiar las acciones existentes
        tipoServicio.getAcciones().clear();

        // Asignar las nuevas acciones al tipo de servicio a través de DetalleServicio
        Set<DetalleServicio> detalleServicios = tipoServicioDto.getAcciones().stream()
                .map(accionesDto -> {
                    Acciones accion = accionesRepository.findById(accionesDto.getAccionesid())
                            .orElseThrow(() -> new IllegalArgumentException("Acción no encontrada: " + accionesDto.getAccionesid()));

                    DetalleServicio detalleServicio = new DetalleServicio();

                    // Crear y configurar TipoAccionesId
                    TipoAccionesId tipoAccionesId = new TipoAccionesId();
                    tipoAccionesId.setAccionesid(accion.getAccionesid());
                    tipoAccionesId.setTiposervicioid(tipoServicio.getTiposervicioid());

                    detalleServicio.setId(tipoAccionesId);
                    detalleServicio.setAcciones(accion);
                    detalleServicio.setTiposervicio(tipoServicio);

                    return detalleServicio;
                })
                .collect(Collectors.toSet());

        tipoServicio.setAcciones(detalleServicios);

        // Guardar los cambios
        tipoServicioRepository.save(tipoServicio);
    }

    @Override
    public TipoServicio obtenerTipoServicio(Integer idtiposervicio) {
        return tipoServicioRepository.findById(idtiposervicio).orElse(null);
    }

}

