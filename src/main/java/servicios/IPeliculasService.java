package servicios;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import modelo.Pelicula;

public interface IPeliculasService {

	List<Pelicula> buscarTodas();

	// buscar las peliculas para mostrarlo de forma paginada
	Page<Pelicula> buscarTodas(Pageable page);

	Pelicula buscarPorId(int idPelicula);

	List<Pelicula> buscarPorEstado(String estado);

	List<String> buscarOrdenamientos();

	Page <Pelicula> ordenarYPaginar(String ordenarPor, Pageable page);

	void insertar(Pelicula pelicula);

	List<String> buscarGeneros();

	void eliminar(int idPelicula);

	long cantidadResultados();

	List<Pelicula> buscarPeliculasHorariosFecha(Date fecha);

}
