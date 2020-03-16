package controladores;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import modelo.Horario;
import modelo.Pelicula;
import servicios.IHorariosService;
import servicios.IPeliculasService;

@Controller
@RequestMapping(value = "/horarios")
public class HorariosController {

	@Autowired
	private IPeliculasService servicePeliculas;

	@Autowired
	private IHorariosService serviceHorarios;

	@GetMapping("/index")
	public String mostrarIndex(Model model, Pageable page) {

		Page<Horario> horarios = serviceHorarios.buscarTodo(page);

		if (horarios.getTotalPages() == (page.getPageNumber() + 1)) {

			model.addAttribute("bloqueado", true);
			
		} else {
			model.addAttribute("bloqueado", false);
		}
		
		long cantidad = serviceHorarios.cantidadResultados();

		model.addAttribute("horarios", horarios);
		model.addAttribute("cantResultados", cantidad);

		return "horarios/listHorarios";
	}

	@GetMapping("/create")
	public String crear(@ModelAttribute Horario horario) {

		return "horarios/formHorario";
	}

	@PostMapping("/save")
	public String guardar(@ModelAttribute Horario horario, BindingResult resultado, Model model,
			RedirectAttributes atributo) {

		if (resultado.hasErrors()) {

			System.out.println("Error en el data binding.");

			return "horarios/formHorario";
		}

		serviceHorarios.insertar(horario);

		atributo.addFlashAttribute("mensaje", "¡El horario ha sido guardado!");

		return "redirect:/horarios/index";
	}

	@GetMapping("/edit/{id}")
	public String editar(@PathVariable("id") int idHorario, Model model) {

		Horario horario = serviceHorarios.buscarPorId(idHorario);

		model.addAttribute("horario", horario);

		return "/horarios/formHorario";
	}

	@GetMapping("/delete/{id}")
	public String eliminar(@PathVariable("id") int idHorario, RedirectAttributes atributo) {

		serviceHorarios.eliminar(idHorario);

		atributo.addFlashAttribute("mensaje", "¡El horario ha sido eliminado!");

		return "redirect:/horarios/index";
	}

	@ModelAttribute("peliculas")
	public List<Pelicula> getPeliculas() {
		return servicePeliculas.buscarTodas();
	}

	// personalizar el data binding para todas las propiedades de tipo date
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(formato, false));
	}

}
