package controladores;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin")
public class LoginController {

	// Se recibe una request donde se obtiene una sesion, y se destruye en caso de que no sea nula
	@GetMapping("/logout")
	public String cerrarSesion(HttpServletRequest request) {

		SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();

		logoutHandler.logout(request, null, null);

		return "redirect:/";
	}

	// El objeto de tipo Authentication contiene los detalles del usuario
	// autenticado
	@GetMapping("/index")
	public String mostrarPrincipalAdmin(Authentication aut, Model model) {

		model.addAttribute("rol", aut.getAuthorities());

		return "principalAdmin";
	}

}
