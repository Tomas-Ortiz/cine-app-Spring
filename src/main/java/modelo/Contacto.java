package modelo;

import java.util.Arrays;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name = "contactos")
public class Contacto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nombre;
	private String email;
	private int experiencia;
	private String comentario;

	@ElementCollection
	@LazyCollection(LazyCollectionOption.FALSE)
	@Column(name = "genero")
	private List<String> generos;

	@ElementCollection
	@LazyCollection(LazyCollectionOption.FALSE)
	@Column(name = "notificacion")
	private List<String> notificaciones;

	public Contacto() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<String> getGeneros() {
		return generos;
	}

	public void setGeneros(List<String> generos) {
		this.generos = generos;
	}

	public List<String> getNotificaciones() {
		return notificaciones;
	}

	public void setNotificaciones(List<String> notificaciones) {
		this.notificaciones = notificaciones;
	}

	public int getExperiencia() {
		return experiencia;
	}

	public void setExperiencia(int experiencia) {
		this.experiencia = experiencia;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	@Override
	public String toString() {
		return "Contacto [id=" + id + ", nombre=" + nombre + ", email=" + email + ", experiencia=" + experiencia
				+ ", comentario=" + comentario + ", generos=" + generos + ", notificaciones=" + notificaciones + "]";
	}

}
