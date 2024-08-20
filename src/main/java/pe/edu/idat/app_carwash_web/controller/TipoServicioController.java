package pe.edu.idat.app_carwash_web.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pe.edu.idat.app_carwash_web.model.bd.dto.AccionesDto;
import pe.edu.idat.app_carwash_web.model.bd.dto.RespuestaGeneral;
import pe.edu.idat.app_carwash_web.model.bd.dto.TipoServicioDto;
import pe.edu.idat.app_carwash_web.model.bd.dto.TipoServicioRequest;
import pe.edu.idat.app_carwash_web.service.IAccionService;
import pe.edu.idat.app_carwash_web.service.ITipoServicioService;

import java.util.List;

@Controller
@RequestMapping("/tipo-servicio")
@AllArgsConstructor
public class TipoServicioController {

    private final ITipoServicioService tipoServicioService;
    private final IAccionService accionService;  // Servicio para obtener las acciones

    @GetMapping("")
    public String frmtiposervicios(Model model) {
        model.addAttribute("listtiposervicio", tipoServicioService.listarTipoServicio());
        return "ptiposervicios/frmtiposervicios";
    }

    @GetMapping("/listar")
    @ResponseBody
    public List<TipoServicioDto> listarTipoServicios() {
        return tipoServicioService.listarTipoServicio();
    }

    @PostMapping("/registrar")
    @ResponseBody
    public RespuestaGeneral guardarTipoServicio(@RequestBody TipoServicioDto tipoServicioDto) {
        String mensaje = "Tipo de servicio registrado correctamente";
        boolean resultado = true;
        try {
            tipoServicioService.guardarTipoServicio(tipoServicioDto);
        } catch (Exception ex) {
            mensaje = "Ha ocurrido un error: " + ex.getMessage();
            resultado = false;
            ex.printStackTrace();
        }
        return RespuestaGeneral.builder().mensaje(mensaje).resultado(resultado).build();
    }

    @PutMapping("/actualizar")
    @ResponseBody
    public RespuestaGeneral actualizarTipoServicio(@RequestBody TipoServicioDto tipoServicioDto) {
        String mensaje = "Tipo de servicio actualizado correctamente";
        boolean resultado = true;
        try {
            tipoServicioService.actualizarTipoServicio(tipoServicioDto);
        } catch (Exception ex) {
            mensaje = "Ha ocurrido un error: " + ex.getMessage();
            resultado = false;
            ex.printStackTrace();
        }
        return RespuestaGeneral.builder().mensaje(mensaje).resultado(resultado).build();
    }

    @GetMapping("/acciones")
    @ResponseBody
    public List<AccionesDto> listarAcciones() {
        return accionService.listarAcciones();  // Obtén la lista de acciones disponibles
    }

    @PostMapping("/guardar")
    @ResponseBody
    public RespuestaGeneral guardarTipoServicioConAcciones(@RequestBody TipoServicioRequest tipoServicioRequest) {
        String mensaje = "Tipo de servicio guardado correctamente";
        boolean resultado = true;
        try {
            // Obtener las acciones por sus IDs
            List<AccionesDto> listaAcciones = accionService.obtenerAccionesPorIds(tipoServicioRequest.getAcciones());

            // Construir el TipoServicioDto usando el builder de Lombok
            TipoServicioDto nuevoTipoServicio = TipoServicioDto.builder()
                    .descripciontps(tipoServicioRequest.getDescripciontps())
                    .tipovehiculo(tipoServicioRequest.getTipovehiculo())
                    .estadotps(tipoServicioRequest.isEstadotps())
                    .acciones(listaAcciones)
                    .build();

            tipoServicioService.guardarTipoServicio(nuevoTipoServicio);
        } catch (Exception ex) {
            mensaje = "Ha ocurrido un error: " + ex.getMessage();
            resultado = false;
            ex.printStackTrace();
        }
        return RespuestaGeneral.builder().mensaje(mensaje).resultado(resultado).build();
    }

}
