package servicios;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import modelo.Horario;

public interface IHorariosService {

	List<Horario> buscarPorIdPelicula(int idPelicula, Date fecha);

	List<Horario> buscarTodos();
	
	Page <Horario> buscarTodo(Pageable page);

	long cantidadResultados();

	void insertar(Horario horario);

	void eliminar(int idHorario);

	Horario buscarPorId(int idHorario);

}
