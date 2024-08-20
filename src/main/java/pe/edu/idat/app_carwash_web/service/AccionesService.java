package pe.edu.idat.app_carwash_web.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pe.edu.idat.app_carwash_web.model.bd.Acciones;
import pe.edu.idat.app_carwash_web.model.bd.dto.AccionesDto;
import pe.edu.idat.app_carwash_web.repository.AccionesRepository;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class AccionesService implements IAccionService{
    private AccionesRepository accionesRepository;

    @Override
    public List<AccionesDto> listarAcciones() {
        List<AccionesDto> accionesDtoList = new ArrayList<>();
        for (Acciones acciones : accionesRepository.findAll()) {
            AccionesDto accionesDto = AccionesDto.builder()
                    .accionesid(acciones.getAccionesid())
                    .descripcion(acciones.getDescripcion())
                    .precio(acciones.getPrecio())
                    .estadoacc(acciones.isEstadoacc()).build();
            accionesDtoList.add(accionesDto);
        }
        return accionesDtoList;
    }


    @Override
    public void guardarAcciones (AccionesDto acciones) {
        if (acciones.getAccionesid() > 0) {
            accionesRepository.actualizarAcciones(
                    acciones.getAccionesid(),
                    acciones.getDescripcion(),
                    acciones.getPrecio(),
                    acciones.isEstadoacc()
            );
        } else {
            Acciones nuevaAccion = new Acciones();
            nuevaAccion.setDescripcion(acciones.getDescripcion());
            nuevaAccion.setPrecio(acciones.getPrecio());
            nuevaAccion.setEstadoacc(true);
            accionesRepository.save(nuevaAccion);
        }
    }



    @Override
    public List<AccionesDto> obtenerAccionesPorIds(List<Integer> ids) {
        List<AccionesDto> accionesDtos = new ArrayList<>();
        List<Acciones> accionesList = accionesRepository.findAllById(ids);

        for (Acciones accion : accionesList) {
            AccionesDto dto = AccionesDto.builder()
                    .accionesid(accion.getAccionesid())
                    .descripcion(accion.getDescripcion())
                    .precio(accion.getPrecio())
                    .estadoacc(accion.isEstadoacc())
                    .build();
            accionesDtos.add(dto);
        }

        return accionesDtos;
    }
}


