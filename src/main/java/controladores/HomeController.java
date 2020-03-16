package controladores;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import modelo.Banner;
import modelo.Horario;
import modelo.Noticia;
import modelo.Pelicula;
import servicios.IBannersService;
import servicios.IHorariosService;
import servicios.INoticiasService;
import servicios.IPeliculasService;
import util.Utileria;

@Controller
public class HomeController {

	@Autowired
	private IPeliculasService servicePeliculas;

	@Autowired
	private IBannersService serviceBanners;

	@Autowired
	private IHorariosService serviceHorarios;

	@Autowired
	private INoticiasService serviceNoticias;

	SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mostrarPrincipal(Model model) {

		Date fecha;

		try {
			fecha = dateFormat.parse(dateFormat.format(new Date()));
			
			List<Pelicula> peliculas = servicePeliculas.buscarPeliculasHorariosFecha(fecha);

			if (peliculas.size() == 0) {
				model.addAttribute("resultado", "¡No se han encontrado peliculas!");
			} else {
				model.addAttribute("peliculas", peliculas);
			}

			model.addAttribute("fechaBusqueda", dateFormat.format(new Date()));

		} catch (ParseException e) {
			System.out.println("Error: HomeController.mostrarPrincipal" + e.getMessage());
		}

		return "home";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String buscar(@RequestParam("fecha") Date fecha, Model model) {

		try {
			Date fechaSinHora = dateFormat.parse(dateFormat.format(fecha));

			List<Pelicula> peliculas = servicePeliculas.buscarPeliculasHorariosFecha(fechaSinHora);

			if (peliculas.size() == 0) {
				model.addAttribute("resultado", "¡No se han encontrado peliculas!");
			} else {
				model.addAttribute("peliculas", peliculas);
			}

			model.addAttribute("fechaBusqueda", dateFormat.format(fecha));

		} catch (ParseException e) {
			System.out.println("Error: HomeController.buscar" + e.getMessage());
		}

		return "home";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String mostrarDetalles(Model model, @RequestParam("idMovie") int idPelicula,
			@RequestParam("fecha") Date fecha) {

		model.addAttribute("pelicula", servicePeliculas.buscarPorId(idPelicula));
		
		List<Horario> horarios = serviceHorarios.buscarPorIdPelicula(idPelicula, fecha);

		model.addAttribute("horarios", horarios);

		model.addAttribute("fechaBusqueda", dateFormat.format(fecha));

		return "detalle";
	}

	@GetMapping(value = "/login")
	public String mostrarLogin() {
		return "formLogin";
	}

	@GetMapping("/about")
	public String acerca() {

		return "acerca";
	}

	@ModelAttribute("fechas")
	private List<String> getFechas() {

		List<String> listaFechas = Utileria.getNextDays(4);

		return listaFechas;
	}

	@ModelAttribute("banners")
	private List<Banner> getBanners() {

		List<Banner> banners = serviceBanners.buscarActivos();

		return banners;
	}

	@ModelAttribute("noticias")
	private List<Noticia> getNoticias() {

		List<Noticia> noticias = serviceNoticias.buscarUltimasTres();

		return noticias;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

}
