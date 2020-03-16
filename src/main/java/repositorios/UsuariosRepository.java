package repositorios;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import modelo.Usuario;

@Repository
public interface UsuariosRepository extends JpaRepository<Usuario, Integer> {

}
