package servicios;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import modelo.Horario;
import repositorios.HorariosRepository;

@Service
public class HorariosServicesJPA implements IHorariosService {

	@Autowired
	private HorariosRepository horariosRepo;

	@Override
	public List<Horario> buscarPorIdPelicula(int idPelicula, Date fecha) {

		return horariosRepo.findByPelicula_idAndFechaOrderByHora(idPelicula, fecha);
	}

	@Override
	public List<Horario> buscarTodos() {

		return horariosRepo.findAll(Sort.by("pelicula_id").ascending());
	}

	@Override
	public long cantidadResultados() {

		return horariosRepo.count();
	}

	@Override
	public void insertar(Horario horario) {

		horariosRepo.save(horario);

	}

	@Override
	public void eliminar(int idHorario) {

		horariosRepo.deleteById(idHorario);

	}

	@Override
	public Horario buscarPorId(int idHorario) {

		Optional<Horario> horario = horariosRepo.findById(idHorario);

		if (horario.isPresent()) {
			return horario.get();
		}

		return null;
	}

	@Override
	public Page<Horario> buscarTodo(Pageable page) {

		return horariosRepo.findAll(page);
	}

}
