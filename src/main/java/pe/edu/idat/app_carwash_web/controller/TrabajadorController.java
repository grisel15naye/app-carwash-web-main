package pe.edu.idat.app_carwash_web.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pe.edu.idat.app_carwash_web.model.bd.dto.RespuestaGeneral;
import pe.edu.idat.app_carwash_web.model.bd.dto.TrabajadorDto;
import pe.edu.idat.app_carwash_web.service.ITrabajadorService;

import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping("/trabajadores")
public class TrabajadorController {
    private ITrabajadorService iTrabajadorService;
    @GetMapping("")

    public String frmTrabajador (Model model){
        model.addAttribute("listtrabajador",
                iTrabajadorService.listarTrabajador());
        return "ptrabajador/frmtrabajador";
    }
    @GetMapping("/listar")
    @ResponseBody
    public List<TrabajadorDto> listarTrabajador(){
        return iTrabajadorService.listarTrabajador();
    }

    @PostMapping("/registrar")
    @ResponseBody
    public RespuestaGeneral guardarTrabajador(
            @RequestBody TrabajadorDto trabajadorDto){
        String mensaje = "Producto registrado correctamente";
        boolean resultado = true;
        try {
            iTrabajadorService.guardarTrabajador(trabajadorDto);
        }catch (Exception ex){
            mensaje = "Error: Ocurrio un error al conectarse a la BD";
            resultado = false;
        }
        return RespuestaGeneral.builder().mensaje(mensaje)
                .resultado(resultado).build();
    }
}
