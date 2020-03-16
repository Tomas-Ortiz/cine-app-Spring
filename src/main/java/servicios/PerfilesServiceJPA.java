package servicios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import modelo.Perfil;
import repositorios.PerfilesRepository;

@Service
public class PerfilesServiceJPA implements IPerfilesService {

	@Autowired
	private PerfilesRepository perfilesRepo;

	@Override
	public void insertar(Perfil perfil) {

		perfilesRepo.save(perfil);

	}

}
