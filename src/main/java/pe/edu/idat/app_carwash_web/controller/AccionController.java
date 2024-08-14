package pe.edu.idat.app_carwash_web.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pe.edu.idat.app_carwash_web.model.bd.dto.AccionesDto;
import pe.edu.idat.app_carwash_web.model.bd.dto.RespuestaGeneral;
import pe.edu.idat.app_carwash_web.service.IAccionService;

import java.util.List;


@AllArgsConstructor
@Controller
@RequestMapping("/acciones")
public class AccionController {
    private IAccionService iaccionService;
    @GetMapping("")

    public String frmAcciones (Model model){
        model.addAttribute("listacciones",
                iaccionService.listarAcciones());
        return "pacciones/frmacciones";
    }
    @GetMapping("/listar")
    @ResponseBody
    public List<AccionesDto> listarAcciones(){
        return iaccionService.listarAcciones();
    }
    @PostMapping("/registrar")
    @ResponseBody
    public RespuestaGeneral guardarAcciones(
            @RequestBody AccionesDto accionesDto){
        String mensaje = "Accion registrada correctamente";
        boolean resultado = true;
        try {
            iaccionService.guardarAcciones(accionesDto);
        }catch (Exception ex){
            mensaje = "Ha ocurrido un error";
            resultado = false;
        }
        return RespuestaGeneral.builder().mensaje(mensaje)
                .resultado(resultado).build();

    }

}
