package repositorios;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import modelo.Perfil;

@Repository
public interface PerfilesRepository extends JpaRepository<Perfil, Integer> {

}
