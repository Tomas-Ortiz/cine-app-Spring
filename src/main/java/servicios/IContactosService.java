package servicios;

import java.util.List;

import modelo.Contacto;

public interface IContactosService {

	void insertar(Contacto contacto);
	
	List <Contacto> buscarTodos();
}
