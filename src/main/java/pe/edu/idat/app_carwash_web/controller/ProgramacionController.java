package pe.edu.idat.app_carwash_web.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pe.edu.idat.app_carwash_web.model.bd.dto.ProgramacionDto;
import pe.edu.idat.app_carwash_web.model.bd.dto.RespuestaGeneral;
import pe.edu.idat.app_carwash_web.service.IProgramacionService;

import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping("/programaciones")
public class ProgramacionController {
    private IProgramacionService iProgramacionService;
    @GetMapping("")
    public  String frmProgramacion(Model model){
        model.addAttribute("listprogramacion",
            iProgramacionService.listarProgramacion());
        return "pprogramacion/frmprogramacion";
    }
    @GetMapping("/listar")
    @ResponseBody
    public List<ProgramacionDto> listarProgramacion(){
        return iProgramacionService.listarProgramacion();
    }
    @PostMapping("/registrar")
    @ResponseBody
    public RespuestaGeneral guardarProgramacion(
            @RequestBody ProgramacionDto productDto){
        String mensaje = "Producto registrado correctamente";
        boolean resultado = true;
        try {
            iProgramacionService.guardarProgramacion(productDto);
        }catch (Exception ex){
            mensaje = "Error: Ocurrio un error al conectarse a la BD";
            resultado = false;
        }
        return RespuestaGeneral.builder().mensaje(mensaje)
                .resultado(resultado).build();
    }

}
