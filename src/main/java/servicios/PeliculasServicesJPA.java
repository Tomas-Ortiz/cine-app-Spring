package servicios;

import java.util.Date;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import modelo.Horario;
import modelo.Pelicula;
import repositorios.HorariosRepository;
import repositorios.PeliculasRepository;

@Service
public class PeliculasServicesJPA implements IPeliculasService {

	@Autowired
	private PeliculasRepository peliculaRepo;

	@Autowired
	private HorariosRepository horariosRepo;

	@Override
	public void insertar(Pelicula pelicula) {

		peliculaRepo.save(pelicula);

	}

	@Override
	public List<Pelicula> buscarTodas() {

		return peliculaRepo.findAll();

	}

	@Override
	public Pelicula buscarPorId(int idPelicula) {

		Optional<Pelicula> pelicula = peliculaRepo.findById(idPelicula);

		if (pelicula.isPresent()) {
			return pelicula.get();
		}

		return null;
	}

	@Override
	public List<String> buscarGeneros() {

		List<String> generos = new LinkedList<>();

		generos.add("Acción");
		generos.add("Aventura");
		generos.add("Clásica");
		generos.add("Comedia");
		generos.add("Comedia Romántica");
		generos.add("Romántica");
		generos.add("Drama");
		generos.add("Terror");
		generos.add("Infantil");
		generos.add("Acción y Aventura");
		generos.add("Ciencia Ficción");

		return generos;
	}

	@Override
	public void eliminar(int idPelicula) {

		peliculaRepo.deleteById(idPelicula);

	}

	@Override
	public long cantidadResultados() {

		return peliculaRepo.count();
	}

	@Override
	public List<Pelicula> buscarPorEstado(String estado) {

		return peliculaRepo.findByEstadoOrderByTitulo(estado);
	}

	@Override
	public List<Pelicula> buscarPeliculasHorariosFecha(Date fecha) {

		// se obtienen todos los horarios de esa fecha y que la pelicula este activa
		//las peliculas se obtienen a partir de los horarios

		List<Horario> horariosFecha = horariosRepo.buscarPeliculasHorariosFecha(fecha);

		List<Pelicula> peliculas = new LinkedList<>();

		for (Horario h : horariosFecha) {
			peliculas.add(h.getPelicula());
		}

		return peliculas;
	}

	@Override
	public Page<Pelicula> buscarTodas(Pageable page) {

		return peliculaRepo.findAll(page);
	}

	@Override
	public List<String> buscarOrdenamientos() {

		List<String> ordenamientos = new LinkedList<String>();

		ordenamientos.add("Titulo");
		ordenamientos.add("Genero");
		ordenamientos.add("Clasificacion");
		ordenamientos.add("Duracion");
		ordenamientos.add("Fecha de estreno");
		ordenamientos.add("Estado");

		return ordenamientos;

	}

	@Override
	public Page<Pelicula> ordenarYPaginar(String ordenarPor, Pageable page) {

		int numPagina = page.getPageNumber();
		int tamañoPagina = page.getPageSize();
		
		return peliculaRepo.findAll(PageRequest.of(numPagina, tamañoPagina, Sort.by(ordenarPor)));
	}

}
