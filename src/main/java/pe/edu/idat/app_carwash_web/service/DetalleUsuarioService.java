package pe.edu.idat.app_carwash_web.service;

import lombok.AllArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pe.edu.idat.app_carwash_web.model.bd.Rol;
import pe.edu.idat.app_carwash_web.model.bd.Usuario;
import pe.edu.idat.app_carwash_web.model.bd.dto.UsuarioSecurityDto;
import pe.edu.idat.app_carwash_web.repository.UsuarioRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@AllArgsConstructor
@Service
public class DetalleUsuarioService
        implements UserDetailsService {
    private UsuarioRepository usuarioRepository;
    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        Usuario usuario = usuarioRepository
                .findByNomusuario(username);
        return obtenerUsuarioSecurity(usuario,
                rolesUsuario(usuario.getRoles()));
    }
    private List<GrantedAuthority> rolesUsuario(
            Set<Rol> roles
    ){
        List<GrantedAuthority> authorityList = new ArrayList<>();
        for(Rol rol: roles){
            authorityList.add(new
                    SimpleGrantedAuthority(rol.getNomrol()));
        }
        return authorityList;
    }
    private UserDetails obtenerUsuarioSecurity(
            Usuario usuario, List<GrantedAuthority> authorityList
    ){
        UsuarioSecurityDto securityDto = new
                UsuarioSecurityDto(usuario.getNomusuario(),
                usuario.getPassword(),
                usuario.getActivo(),
                true,
                true,
                true, authorityList);
        securityDto.setEmail(usuario.getEmail());
        securityDto.setIdusuario(usuario.getIdusuario());
        return securityDto;
    }
}
