package repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import modelo.Banner;

@Repository
public interface BannersRepository extends JpaRepository<Banner, Integer> {

	List <Banner> findByEstado(String estado);
}
