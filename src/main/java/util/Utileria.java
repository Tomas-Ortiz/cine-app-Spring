package util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class Utileria {

	// regresa n fechas siguientes a partir de la fecha actual
	public static List<String> getNextDays(int n) {

		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

		Date fechaActual = new Date();

		Calendar cal = Calendar.getInstance();

		// se suman 4 dias del calendario a partir del dia actual del mes
		cal.add(Calendar.DAY_OF_MONTH, n);

		Date fechaFinal = cal.getTime();

		GregorianCalendar gcal = new GregorianCalendar();

		gcal.setTime(fechaActual);

		List<String> proximasFechas = new ArrayList<String>();

		// si la fecha actual (gcal.getTime) no es posterior a la fecha especificada
		// (fechaFinal) se la agrega
		// after es true si la fecha es posterior a la fecha especificada
		while (!gcal.getTime().after(fechaFinal)) {

			Date fechaSiguiente = gcal.getTime();

			gcal.add(Calendar.DATE, 1);

			proximasFechas.add(sdf.format(fechaSiguiente));

		}
		return proximasFechas;
	}

	public static String guardarImagen(MultipartFile multipart, HttpServletRequest request) {

		String nombreArchivo = multipart.getOriginalFilename();

		// en el nombre se reemplazan los espacios (en caso que tenga) por guiones
		nombreArchivo = nombreArchivo.replace(" ", "-");

		// se concatena la cadena aleatoria con el nombre del archivo
		String nombreFinal = generarAlfaNumericoAleatorio(8) + nombreArchivo;

		// se obtiene la ruta absoluta del archivo
		String rutaFinal = request.getServletContext().getRealPath("/resources/images/");

		try {

			File archivoImagen = new File(rutaFinal + nombreFinal);

			System.out.println(archivoImagen.getAbsolutePath());

			// se guarda el archivo en el disco duro
			multipart.transferTo(archivoImagen);

			return nombreFinal;

		} catch (IOException e) {
			System.out.println("Error: " + e.getMessage());
			return null;
		}
	}

	// metodo que genera una cadena alfanumerica aleatoria, para evitar la
	// duplicidad de nombres de las imagenes subidas
	public static String generarAlfaNumericoAleatorio(int tamaño) {

		String alfanumerico = "ABCDEFGHIJKLMNOPQRSTWXYZ0123456789";

		StringBuilder cadena = new StringBuilder();

		int rango = alfanumerico.length();

		while (tamaño-- != 0) {

			int caracter = (int) (Math.random() * rango);

			cadena.append(alfanumerico.charAt(caracter));
		}

		return cadena.toString();
	}

}
