package controladores;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import modelo.Banner;
import servicios.IBannersService;
import util.Utileria;

@Controller
@RequestMapping("/banners")
public class BannersController {

	@Autowired
	private IBannersService servicesBanner;

	@GetMapping("/index")
	public String mostrarIndex(Model model, Pageable page) {

		Page<Banner> banners = servicesBanner.buscarTodas(page);

		if (banners.getTotalPages() == (page.getPageNumber() + 1)) {

			model.addAttribute("bloqueado", true);
			
		} else {
			model.addAttribute("bloqueado", false);
		}

		long cantResultados = servicesBanner.cantidadResultados();

		model.addAttribute("banners", banners);
		model.addAttribute("cantResultados", cantResultados);

		return "banners/listBanners";
	}

	@GetMapping("/create")
	public String crear(@ModelAttribute Banner banner) {
		return "banners/formBanner";
	}

	@PostMapping("/save")
	public String guardar(@ModelAttribute Banner banner, BindingResult resultado, RedirectAttributes atributo,
			@RequestParam("archivoImagen") MultipartFile multipart, HttpServletRequest request) {

		if (resultado.hasErrors()) {
			System.out.println("Existe error en el data binding.");
			return "banners/formBanner";
		}

		if (!multipart.isEmpty()) {
			String nombreImagen = Utileria.guardarImagen(multipart, request);

			banner.setImagen(nombreImagen);
		}

		servicesBanner.insertar(banner);

		atributo.addFlashAttribute("mensaje", "¡El banner ha sido insertado!");

		return "redirect:/banners/index";
	}

	@GetMapping("/edit/{id}")
	public String editar(@PathVariable("id") int idBanner, Model model) {

		Banner banner = servicesBanner.buscarPorId(idBanner);

		model.addAttribute("banner", banner);

		return "banners/formBanner";
	}

	@GetMapping("/delete/{id}")
	public String eliminar(@PathVariable("id") int idBanner, RedirectAttributes atributo) {

		servicesBanner.eliminar(idBanner);

		atributo.addFlashAttribute("mensaje", "¡El banner ha sido eliminado!");

		return "redirect:/banners/index";
	}

}
