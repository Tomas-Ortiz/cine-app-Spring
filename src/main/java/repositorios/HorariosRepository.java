package repositorios;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import modelo.Horario;

@Repository
public interface HorariosRepository extends JpaRepository<Horario, Integer> {

	// query method
	// para acceder al id de la pelicula de cada horario: pelicula_id
	List<Horario> findByPelicula_idAndFechaOrderByHora(int idPelicula, Date Fecha);

	// Query para declara consultas explicitas en metodos de repositorios
	// Param vincula un parametro a una consulta (fecha)

	// se buscan peliculas activas, con horarios en una fecha determinada, y se
	// ordena por id de forma ascendente
	
	// JPQL: @Query("select h from Horario h where h.fecha = :fecha and
	// pelicula.estado='Activa' group by h.pelicula order by pelicula.id asc")
	
	//SQL:
	@Query(value = "SELECT * FROM horarios, peliculas WHERE horarios.fecha = :fecha AND peliculas.estado='Activa' AND horarios.idPelicula = peliculas.id GROUP BY peliculas.id ORDER BY peliculas.id ASC", nativeQuery = true)
	List<Horario> buscarPeliculasHorariosFecha(@Param("fecha") Date fecha);
}
