package repositorios;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import modelo.Noticia;

@Repository
public interface NoticiasRepository extends JpaRepository<Noticia, Integer> {
	
	List <Noticia> findTop3ByEstadoOrderByIdDesc(String estado);

}
