package controladores;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import modelo.Contacto;
import servicios.IContactosService;
import servicios.IPeliculasService;

@Controller
public class ContactoController {

	@Autowired
	private IPeliculasService servicePeliculas;

	@Autowired
	private IContactosService serviceContactos;

	@GetMapping("/contact")
	public String mostrarForm(@ModelAttribute("contact") Contacto contacto, Model model) {

		List<String> generos = servicePeliculas.buscarGeneros();

		model.addAttribute("generos", generos);
		model.addAttribute("tipos", getNotificaciones());
		
		return "formContacto";
	}

	@PostMapping("/send")
	public String guardar(@ModelAttribute("contact") Contacto contacto, BindingResult resultado,
			RedirectAttributes atributo) {

		if (resultado.hasErrors()) {
			System.out.println("Error en el data binding." + resultado.getAllErrors());
			
			return "formContacto";
		}

		serviceContactos.insertar(contacto);

		atributo.addFlashAttribute("mensaje", "¡Gracias " + contacto.getNombre() + ", tu mensaje ha sido enviado!");

		return "redirect:/contact";
	}

	private List<String> getNotificaciones() {

		List<String> tipos = new LinkedList<>();

		tipos.add("Estrenos");
		tipos.add("Promociones");
		tipos.add("Noticias");
		tipos.add("Preventas");

		return tipos;
	}

}
