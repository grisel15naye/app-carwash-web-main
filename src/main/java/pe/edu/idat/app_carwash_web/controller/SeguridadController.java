package pe.edu.idat.app_carwash_web.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pe.edu.idat.app_carwash_web.model.bd.Usuario;
import pe.edu.idat.app_carwash_web.model.bd.dto.RespuestaGeneral;
import pe.edu.idat.app_carwash_web.model.bd.dto.UsuarioRequest;
import pe.edu.idat.app_carwash_web.service.IUsuarioService;

import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping("/seguridad")
public class SeguridadController {
    private IUsuarioService iUsuarioService;

    @GetMapping("/usuario/registro")
    public String frmUsuario(Model model){
        model.addAttribute("listausuarios",
                iUsuarioService.listarUsuario());
        return "seguridad/frmusuario";
    }

    @PostMapping("/usuario")
    @ResponseBody
    public RespuestaGeneral registrarUsuario(
            @RequestBody UsuarioRequest usuarioRequest)
    {
        String mensaje = "Usuario registrado correctamente";
        boolean respuesta = true;
        try {
            Usuario usuario = new Usuario();
            usuario.setNombres(usuarioRequest.getNombres());
            usuario.setApellidos(usuarioRequest.getApellidos());
            if(usuarioRequest.getIdusuario() > 0){
                usuario.setIdusuario(usuarioRequest.getIdusuario());
                usuario.setActivo(usuarioRequest.getActivo());
                iUsuarioService.actualizarUsuario(usuario);
            }else{
                usuario.setNomusuario(usuarioRequest.getNomusuario());
                usuario.setEmail(usuarioRequest.getEmail());
                iUsuarioService.guardarUsuario(usuario);
            }
        }catch (Exception ex){
            mensaje = "Error al conectarse a la base de datos";
            respuesta = false;
        }
        return RespuestaGeneral.builder()
                .mensaje(mensaje)
                .resultado(respuesta).build();
    }

    @GetMapping("/usuario/{id}")
    @ResponseBody
    public Usuario obtenerUsuario(
            @PathVariable("id") int id){
        return iUsuarioService.obtenerUsuarioxId(id);
    }

    @GetMapping("/usuario")
    @ResponseBody
    public List<Usuario> listarUsuario(){
        return iUsuarioService.listarUsuario();
    }
}
