package servicios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import modelo.Usuario;
import repositorios.UsuariosRepository;

@Service
public class UsuariosServiceJPA implements IUsuariosService {

	@Autowired
	private UsuariosRepository usuariosRepo;

	@Override
	public void insertar(Usuario usuario) {
		usuariosRepo.save(usuario);
	}

}
