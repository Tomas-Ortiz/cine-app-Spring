package servicios;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import modelo.Banner;

public interface IBannersService {

	void insertar(Banner banner);

	List<Banner> buscarTodos();

	Page<Banner> buscarTodas(Pageable page);

	List<Banner> buscarActivos();

	void eliminar(int idBanner);

	Banner buscarPorId(int idBanner);

	long cantidadResultados();

}
