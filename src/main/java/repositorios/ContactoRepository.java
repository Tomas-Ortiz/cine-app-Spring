package repositorios;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import modelo.Contacto;

@Repository
public interface ContactoRepository extends JpaRepository<Contacto, Integer> {

}
