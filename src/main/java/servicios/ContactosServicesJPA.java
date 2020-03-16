package servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import modelo.Contacto;
import repositorios.ContactoRepository;

@Service
public class ContactosServicesJPA implements IContactosService {

	@Autowired
	private ContactoRepository contactosRepo;

	@Override
	public void insertar(Contacto contacto) {

		contactosRepo.save(contacto);

	}

	@Override
	public List<Contacto> buscarTodos() {

		return contactosRepo.findAll();
	}

}
