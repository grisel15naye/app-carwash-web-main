package pe.edu.idat.app_carwash_web.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pe.edu.idat.app_carwash_web.model.bd.Acciones;
import pe.edu.idat.app_carwash_web.model.bd.DetalleServicio;
import pe.edu.idat.app_carwash_web.model.bd.TipoServicio;
import pe.edu.idat.app_carwash_web.model.bd.dto.AccionesDto;
import pe.edu.idat.app_carwash_web.model.bd.dto.RespuestaGeneral;
import pe.edu.idat.app_carwash_web.service.IAccionService;
import pe.edu.idat.app_carwash_web.service.IDetalleServicioService;
import pe.edu.idat.app_carwash_web.service.ITipoServicioService;

import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping("/tipo-servicio")
public class TipoServicioController {
    private  ITipoServicioService tipoServicioService;

    @GetMapping ("")
    public String frmtiposervicios(Model model) {
        model.addAttribute("listtiposervicio",
            tipoServicioService.listarTipoServicios());
        return "ptiposervicios/frmtiposervicios";
    }
    @GetMapping("/listar")
    @ResponseBody
    public List<TipoServicio> listarTipoServicios() {
        return tipoServicioService.listarTipoServicios();
    }
    @PostMapping("/registrar")
    @ResponseBody
    public RespuestaGeneral guardarTipoServicio(
            @RequestBody TipoServicio tipoServicio){
        String mensaje = "Tipo de servicio registrado correctamente";
        boolean resultado = true;
        try {
            tipoServicioService.guardarTipoServicio(tipoServicio);
        }catch (Exception ex){
            mensaje = "Ha ocurrido un error";
            resultado = false;
        }
        return RespuestaGeneral.builder().mensaje(mensaje).resultado(resultado).build();
    }
}