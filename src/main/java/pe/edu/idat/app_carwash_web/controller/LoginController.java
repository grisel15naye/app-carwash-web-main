package pe.edu.idat.app_carwash_web.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pe.edu.idat.app_carwash_web.model.bd.dto.UsuarioSecurityDto;

@Controller
@RequestMapping("/auth")
public class LoginController {
    @GetMapping("/login")
    public String login(){
        return "auth/login";
    }
    @GetMapping("/login-success")
    public String loginSuccess(){
        return "redirect:/auth/dashboard";
    }

    @GetMapping("/dashboard")
    public String dasboard(HttpServletRequest request){
        HttpSession session = request.getSession();
        UserDetails userDetails = (UserDetails)
                SecurityContextHolder.getContext()
                        .getAuthentication().getPrincipal();
        UsuarioSecurityDto securityDto = (UsuarioSecurityDto) userDetails;
        session.setAttribute("nomusuario",
                securityDto.getEmail());
        return "auth/home";
    }

}
