 package controladores;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.xml.internal.ws.api.ServiceSharedFeatureMarker;

import modelo.Pelicula;
import servicios.IDetallesService;
import servicios.IPeliculasService;
import util.Utileria;

@Controller
@RequestMapping("/peliculas")
public class PeliculasController {

	// inyectar instancia de una clase que implemente la interfaz
	@Autowired
	private IDetallesService serviceDetalles;

	@Autowired
	private IPeliculasService servicePeliculas;

	SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

	// por defecto se ordena por Titulo
	private String ordenarPor = "Titulo";

	// se guarda la pagina actual para que cuando se ordene y redireccione, se
	// mantenga en la pagina en la que estaba el usuario
	private int paginaActual = 0;

	// Para la paginacion, el controlador debe recibir un objeto de tipo Pageable
	// por lo tanto, al metodo se le pueden pasar los parametros page, limit y sort
	@GetMapping("/index")
	public String mostrarIndexPaginado(Model model, Pageable page) {

		paginaActual = page.getPageNumber();

		if (ordenarPor.equals("Fecha de estreno")) {
			ordenarPor = "fechaEstreno";
		}

		Page<Pelicula> peliculasPaginadas = servicePeliculas.ordenarYPaginar(ordenarPor, page);

		if (peliculasPaginadas.getTotalPages() == (page.getPageNumber() + 1)) {

			model.addAttribute("bloqueado", true);
			
		} else {
			model.addAttribute("bloqueado", false);
		}

		// Objeto de tipo Pageable: Page request [number: 0, size 5, sort: UNSORTED]

		long cantResultados = servicePeliculas.cantidadResultados();

		model.addAttribute("peliculas", peliculasPaginadas);
		model.addAttribute("cantResultados", cantResultados);
		model.addAttribute("ordenadoPor", ordenarPor);

		return "peliculas/listPeliculas";
	}

	@GetMapping("/create")
	public String crear(@ModelAttribute Pelicula pelicula) {

		return "peliculas/formPelicula";
	}

	@PostMapping("/save")
	public String guardar(@ModelAttribute Pelicula pelicula, BindingResult resultado, RedirectAttributes atributo,
			@RequestParam("archivoImagen") MultipartFile multiPart, HttpServletRequest request) {

		if (resultado.hasErrors()) {

			System.out.println("Existe error en el data binding.");

			return "peliculas/formPelicula";
		}

		// si no se selecciona una imagen, se deja la imagen actual
		if (!multiPart.isEmpty()) {

			String nombreImagen = Utileria.guardarImagen(multiPart, request);

			pelicula.setImagen(nombreImagen);

		}
	
		serviceDetalles.insertar(pelicula.getDetalle());

		servicePeliculas.insertar(pelicula);

		// los atributos flash guardan datos temporalmente para que se puedan usar
		// despues de redireccionar a otra url
		// son almacenados en una sesion y despues del redirect se borran
		atributo.addFlashAttribute("mensaje", "¡La pelicula fue guardada!");

		return "redirect:/peliculas/index";
	}

	@GetMapping("/edit/{id}")
	public String editar(@PathVariable("id") int idPelicula, Model model) {

		Pelicula pelicula = servicePeliculas.buscarPorId(idPelicula);

		model.addAttribute("pelicula", pelicula);

		return "peliculas/formPelicula";
	}

	@GetMapping("/delete/{id}")
	public String eliminar(@PathVariable("id") int idPelicula, RedirectAttributes atributo) {

		// Primero se elimina la pelicula, y despues los detalles

		Pelicula pelicula = servicePeliculas.buscarPorId(idPelicula);

		servicePeliculas.eliminar(idPelicula);

		serviceDetalles.eliminar(pelicula.getDetalle().getId());

		atributo.addFlashAttribute("mensaje", "¡La pelicula ha sido eliminada!");

		return "redirect:/peliculas/index";
	}

	@PostMapping("/orderBy")
	public String ordenarPor(@RequestParam("ordenarPor") String ordenarPor, RedirectAttributes atributo) {

		this.ordenarPor = ordenarPor;

		// cuando se ordena se mantiene en la pagina actual
		// De lo contrario, redireccionaria a la pagina 0
		return "redirect:/peliculas/index?page=" + paginaActual;
	}

	@ModelAttribute("generos")
	public List<String> getGeneros() {

		return servicePeliculas.buscarGeneros();
	}

	@ModelAttribute("ordenamientos")
	public List<String> getOrdenamientos() {

		return servicePeliculas.buscarOrdenamientos();
	}

	// anotacion para crear un metodo para configurar el data binding en el
	// controlador
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

}
