package servicios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import modelo.Detalle;
import repositorios.DetallesRepository;

@Service
public class DetallesServiceJPA implements IDetallesService {

	@Autowired
	private DetallesRepository detalleRepo;

	@Override
	public void insertar(Detalle detalle) {

		detalleRepo.save(detalle);

	}

	@Override
	public void eliminar(int idDetalle) {

		detalleRepo.deleteById(idDetalle);
	}

}
