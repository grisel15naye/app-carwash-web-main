package pe.edu.idat.app_carwash_web.service;

import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pe.edu.idat.app_carwash_web.model.bd.Rol;
import pe.edu.idat.app_carwash_web.model.bd.Usuario;
import pe.edu.idat.app_carwash_web.repository.RolRepository;
import pe.edu.idat.app_carwash_web.repository.UsuarioRepository;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
@AllArgsConstructor
@Service
public class UsuarioService implements IUsuarioService {
    private UsuarioRepository usuarioRepository;
    private RolRepository rolRepository;
    BCryptPasswordEncoder bCryptPasswordEncoder
            = new BCryptPasswordEncoder();
    @Override
    public Usuario obtenerUsuarioxNomusuario(String nomusuario) {
        return usuarioRepository.findByNomusuario(nomusuario);
    }

    @Override
    public Usuario guardarUsuario(Usuario usuario) {
        usuario.setPassword(bCryptPasswordEncoder
                .encode("123456"));
        usuario.setActivo(true);
        Rol usuarioRol = rolRepository.findByNomrol("USER");
        usuario.setRoles(new
                HashSet<>(Arrays.asList(usuarioRol)));
        return usuarioRepository.save(usuario);
    }

    @Override
    public List<Usuario> listarUsuario() {
        return usuarioRepository.findAll();
    }
    @Override
    public Usuario obtenerUsuarioxId(Integer id) {
        return usuarioRepository.findById(id).orElse(null);
    }
    @Override
    public void actualizarUsuario(Usuario usuario) {
        usuarioRepository.actualizarUsuario(
                usuario.getNombres(), usuario.getApellidos(),
                usuario.getActivo(), usuario.getIdusuario());
    }
}
