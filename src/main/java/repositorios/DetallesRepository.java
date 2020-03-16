package repositorios;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import modelo.Detalle;

@Repository
public interface DetallesRepository extends JpaRepository<Detalle, Integer> {

	
	
}
