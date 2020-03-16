package servicios;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import modelo.Banner;
import repositorios.BannersRepository;

@Service
public class BannersServicesJPA implements IBannersService {

	@Autowired
	private BannersRepository bannersRepo;

	@Override
	public void insertar(Banner banner) {

		bannersRepo.save(banner);

	}

	@Override
	public List<Banner> buscarTodos() {

		List<Banner> banners = bannersRepo.findAll();

		return banners;
	}

	@Override
	public void eliminar(int idBanner) {

		bannersRepo.deleteById(idBanner);
	}

	@Override
	public Banner buscarPorId(int idBanner) {

		Optional<Banner> banner = bannersRepo.findById(idBanner);

		if (banner.isPresent()) {
			return banner.get();
		}

		return null;
	}

	@Override
	public long cantidadResultados() {

		return bannersRepo.count();
	}

	@Override
	public List<Banner> buscarActivos() {

		return bannersRepo.findByEstado("Activo");
	}

	@Override
	public Page<Banner> buscarTodas(Pageable page) {

		return bannersRepo.findAll(page);
	}

}
