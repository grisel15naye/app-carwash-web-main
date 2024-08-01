package pe.edu.idat.app_carwash_web.service;

import pe.edu.idat.app_carwash_web.model.bd.Usuario;

import java.util.List;

public interface IUsuarioService {

    Usuario obtenerUsuarioxNomusuario(String nomusuario);
    Usuario guardarUsuario(Usuario usuario);
    List<Usuario> listarUsuario();
    Usuario obtenerUsuarioxId(Integer id);
    void actualizarUsuario(Usuario usuario);

}
