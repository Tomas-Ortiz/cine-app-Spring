package controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import modelo.Perfil;
import modelo.Usuario;
import servicios.IPerfilesService;
import servicios.IUsuariosService;

@Controller
@RequestMapping("/usuarios")
public class UsuariosController {

	@Autowired
	private IUsuariosService serviceUsuarios;
	@Autowired
	private IPerfilesService servicePerfiles;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@GetMapping("/index")
	public String mostrarPrincipal() {

		return "usuarios/listUsuarios";
	}

	@GetMapping("/create")
	public String crear(@ModelAttribute Usuario usuario) {
		return "usuarios/formUsuario";
	}

	@PostMapping("/save")
	public String guardar(@ModelAttribute Usuario usuario, @RequestParam("perfil") String perfil,
			RedirectAttributes atributo) {

		try {

			String encriptada = encoder.encode(usuario.getPassword());
			usuario.setPassword(encriptada);
			usuario.setActivo(1);

			serviceUsuarios.insertar(usuario);

			Perfil perfilUser = new Perfil();

			perfilUser.setUsername(usuario.getUsername());
			perfilUser.setPerfil(perfil);

			servicePerfiles.insertar(perfilUser);

			return "redirect:/usuarios/index";

			// Se produce una excepcion cuando se duplican indices unicos (username, perfil)
			// ya que se esta violando una restriccion de integridad de la BD
		} catch (DataIntegrityViolationException e) {

			System.out.println(e.getMessage());

			atributo.addFlashAttribute("mensaje", "¡Error, no se puede duplicar el usuario y el rol!");

			return "redirect:/usuarios/create";
		}
	}

}
