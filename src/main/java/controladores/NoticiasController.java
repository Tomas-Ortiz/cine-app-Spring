package controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import modelo.Noticia;
import servicios.INoticiasService;

@Controller
@RequestMapping(value = "/noticias")
public class NoticiasController {

	@Autowired
	private INoticiasService servicesNoticias;

	@GetMapping("index")
	public String mostrarPrincipal(Model model, Pageable page) {

		Page<Noticia> noticias = servicesNoticias.buscarTodas(page);

		if (noticias.getTotalPages() == (page.getPageNumber() + 1)) {

			model.addAttribute("bloqueado", true);
			
		} else {
			model.addAttribute("bloqueado", false);
		}

		model.addAttribute("noticias", noticias);

		long cantResultados = servicesNoticias.cantidadResultados();

		model.addAttribute("cantResultados", cantResultados);

		return "noticias/listNoticias";
	}

	@GetMapping(value = "/create")
	public String crear(@ModelAttribute Noticia noticia) {

		return "noticias/formNoticia";
	}

	@PostMapping(value = "/save")
	public String guardar(@ModelAttribute Noticia noticia, RedirectAttributes atributo) {

		servicesNoticias.guardar(noticia);

		atributo.addFlashAttribute("mensaje", "¡La noticia ha sido creada!");

		return "redirect:/noticias/index";
	}

	@GetMapping("/edit/{id}")
	public String editar(@PathVariable("id") int idNoticia, Model model) {

		Noticia noticia = servicesNoticias.buscarPorId(idNoticia);

		model.addAttribute("noticia", noticia);

		return "noticias/formNoticia";
	}

	@GetMapping("/delete/{id}")
	public String eliminar(@PathVariable("id") int idNoticia, RedirectAttributes atributo) {

		servicesNoticias.eliminarPorId(idNoticia);

		atributo.addFlashAttribute("mensaje", "¡La pelicula ha sido eliminada!");

		return "redirect:/noticias/index";
	}

}
