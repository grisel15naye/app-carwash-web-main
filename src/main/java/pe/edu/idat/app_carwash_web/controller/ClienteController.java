package pe.edu.idat.app_carwash_web.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pe.edu.idat.app_carwash_web.model.bd.Cliente;
import pe.edu.idat.app_carwash_web.model.bd.dto.RespuestaGeneral;
import pe.edu.idat.app_carwash_web.service.IClienteService;

import java.util.List;
@AllArgsConstructor
@Controller
@RequestMapping("/clientes")
public class ClienteController {
    private IClienteService iClienteService;
    @GetMapping("")

    public String frmCliente (Model model){
        model.addAttribute("listcliente",
                iClienteService.listarCliente());
        return "pcliente/frmcliente";

    }
    @GetMapping("/listar")
    @ResponseBody
    public List<Cliente> listarCliente(){
        return iClienteService.listarCliente();
    }

    @PostMapping("/registrar")
    @ResponseBody
    public RespuestaGeneral guardarCliente(
            @RequestBody Cliente cliente){
        String mensaje = "Producto registrado correctamente";
        boolean resultado = true;
        try {
            iClienteService.guardarCliente(cliente);
        }catch (Exception ex){
            mensaje = "Error: Ocurrio un error al conectarse a la BD";
            resultado = false;
        }
        return RespuestaGeneral.builder().mensaje(mensaje)
                .resultado(resultado).build();
    }
    @PostMapping("/actualizar")
    @ResponseBody
    public RespuestaGeneral actualizarCliente(@RequestBody Cliente cliente) {
        String mensaje = "Cliente actualizado correctamente";
        boolean resultado = true;
        try {
            iClienteService.guardarCliente(cliente); // Aquí llamamos a guardarCliente para que se guarden los cambios.
        } catch (Exception ex) {
            mensaje = "Error: Ocurrio un error al conectarse a la BD";
            resultado = false;
        }
        return RespuestaGeneral.builder().mensaje(mensaje).resultado(resultado).build();
    }
}



