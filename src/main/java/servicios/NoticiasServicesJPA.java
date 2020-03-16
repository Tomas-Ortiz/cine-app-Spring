package servicios;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import modelo.Noticia;
import repositorios.NoticiasRepository;

@Repository
public class NoticiasServicesJPA implements INoticiasService {

	@Autowired
	private NoticiasRepository noticiasRepo;

	@Override
	public void guardar(Noticia noticia) {

		noticiasRepo.save(noticia);

	}

	@Override
	public List<Noticia> buscarTodas() {

		return noticiasRepo.findAll();
	}

	@Override
	public void eliminarPorId(int idNoticia) {

		noticiasRepo.deleteById(idNoticia);

	}

	@Override
	public Noticia buscarPorId(int idNoticia) {

		Optional<Noticia> noticia = noticiasRepo.findById(idNoticia);

		if (noticia.isPresent()) {
			return noticia.get();
		}
		return null;
	}

	@Override
	public long cantidadResultados() {

		return noticiasRepo.count();
	}

	@Override
	public List<Noticia> buscarUltimasTres() {

		return noticiasRepo.findTop3ByEstadoOrderByIdDesc("Activa");
	}

	@Override
	public Page<Noticia> buscarTodas(Pageable page) {

		return noticiasRepo.findAll(page);
	}

}
