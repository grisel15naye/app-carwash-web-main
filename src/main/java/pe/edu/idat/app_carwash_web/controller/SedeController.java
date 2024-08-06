package pe.edu.idat.app_carwash_web.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pe.edu.idat.app_carwash_web.model.bd.Sede;
import pe.edu.idat.app_carwash_web.model.bd.dto.RespuestaGeneral;
import pe.edu.idat.app_carwash_web.service.ISedeService;

import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping ("/sedes")
public class SedeController {
    private ISedeService iSedeService;
    @GetMapping("")

    public String frmSede (Model model){
        model.addAttribute("listsede",
                iSedeService.listarSede());
        return "psede/frmsede";

    }
    @GetMapping("/listar")
    @ResponseBody
    public List<Sede> listarSede(){
        return iSedeService.listarSede();
    }

    @PostMapping("/registrar")
    @ResponseBody
    public RespuestaGeneral guardarSede(@RequestBody Sede sede){
        String mensaje = "Producto registrado correctamente";
        boolean resultado = true;
        try {
            if (sede.getNombresede() == null || sede.getNombresede().isEmpty()) {
                throw new IllegalArgumentException("La sede no debe estar vacia");
            }
            if (sede.getHoraabierto() == null) {
                throw new IllegalArgumentException("La hora de apertura no debe estar vacia");
            }
            if (sede.getHoracierre() == null) {
                throw new IllegalArgumentException("La hora de cierre no debe estar vacia");
            }

            // Forzar estadosede a true cuando se agrega una nueva sede
            if (sede.getSedeid() == null) {
                sede.setEstadosede(true);
            }

            iSedeService.guardarSede(sede);
        } catch (IllegalArgumentException ex) {
            mensaje = ex.getMessage();
            resultado = false;
        } catch (Exception ex) {
            mensaje = "Error: Ocurrió un error al conectarse a la BD";
            resultado = false;
        }

        return RespuestaGeneral.builder()
                .mensaje(mensaje)
                .resultado(resultado)
                .build();
    }
}