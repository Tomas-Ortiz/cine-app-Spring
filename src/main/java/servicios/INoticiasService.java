package servicios;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import modelo.Noticia;

public interface INoticiasService {

	List<Noticia> buscarTodas();
	
	Page <Noticia> buscarTodas(Pageable page);

	void guardar(Noticia noticia);

	void eliminarPorId(int idNoticia);

	Noticia buscarPorId(int idNoticia);

	long cantidadResultados();

	List<Noticia> buscarUltimasTres();

}
