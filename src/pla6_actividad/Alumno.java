package pla6_actividad;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;

//import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import pla6_actividad.validacion.ValidarDni;

public class Alumno {
	//@NotNull, @NotEmpty no sirven
	//@NotBlank /*Tampoco sirve pues da por bueno "  A"*/
	/*Como mínimo tiene que haber tres caracteres seguidos*/
	@Pattern(regexp="^.*[^\\s]{3,}.*$", message="El nombre ha de tener como mínimo 3 caracteres seguidos")
	//@Size(min=3, message="El nombre ha de tener como mínimo 3 caracteres")
	private String nombre;

	/* Aquí lo normal sería que no fuera nulo, pero supongo que se ha dado la
	 * posibiliad para que haya que implementarla*/
	@ValidarDni
	private String dni;
	
	/* No es obligado así que permitimos que esté vacío en la regex. Usamos un tipo
	 * de email sencillo:
	 * + Empieza por letra o número
	 * + Puede ir seguido de letras, números o puntos, siempre que estos últimos
	 * 		no estén seguidos (negative lookahead)
	 * + @ y luego sólo letras
	 * + Bueno, y el . más dos o tres caracteres*/
	@Pattern(regexp="[A-Za-z0-9](?!.*\\.\\.)[A-Za-z0-9\\.]+\\@[A-Za-z]+\\.\\w{2,3}$|", 
						message="Formato requerido: números, letras(no la ñ) y puntos (puntos no seguidos) @ letras.aaa")
	private String email;

	/* A estas dos, radio buttons y check boxes, no les pondré ninguna opción por
	 * defecto, por aquello de que el usuario sea el que elija. Pero, obviamente,
	 * han de ser no nulas las elecciones*/
	/* Tal vez sería mejor usar un boolean*/
	@NotNull(message="Ha de escoger una de las dos opciones")
	private String becado;

	/* Para los checkboxes lo que hay que mirar el tamaño del array donde se guardan
	 * las elecciones y no usar @NotNull*/
	/* No se puede dar el valor con Asignaturas.values().length;
	 * Si bien aquí no es necesario, he leído que habría que hacerlo con Maven, Ant...*/
	@Size(min=1, message ="Ha de escoger al menos una opción")
	private String[] asignaturas;
	
	/* Lista de todas las posibles asignaturas, de las cuales con un checkbox el
	 *  alumno elegirá cuáles quiere cursar y se guardarán en el array asignaturas
	 *  acabado de declarar. Tal vez esta lista debería de formar parte de una clase
	 *  Escuela por ejemplo, siendo su oferta global y el alumno escogiendo sólo
	 *  las que le apetezcan*/
	private Map<String,String> listaAsignaturas;
	/* Y para las opciones Sí/No de Becado, implementado con radio buttons*/
	private Map<String,String> listaBecado;
	
	/*GETTERS y SETTERS*/
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getBecado() {
		return becado;
	}
	public void setBecado(String becado) {
		this.becado = becado;
	}

	public String[] getAsignaturas() {
		return asignaturas;
	}
	public void setAsignaturas(String[] asignaturas) {
		this.asignaturas = asignaturas;
	}
	
	public Map<String, String> getListaAsignaturas() {
		return listaAsignaturas;
	}
	public Map<String, String> getListaBecado() {
		return listaBecado;
	}	
	
	public Alumno() {
		//super();
		/* Mientras no se haga a partir de la BD, cargamos la lista de asignaturas 
		 * para los checkbox del formulario a partir del enum Asignaturas. Porque es
		 * una lista que usamos en más de un lugar y, si hay cambios, que sólo haya
		 * que realizarlos en un lugar: el enum*/
		listaAsignaturas = new LinkedHashMap<String,String>();
		Arrays.asList(Asignaturas.values()).stream().forEach( a ->
			listaAsignaturas.put(a.toString(), a.getAsignatura())
		);
		/*Esta es una lista cerrada, así que la implemento así:*/
		listaBecado = new LinkedHashMap<String,String>();
		listaBecado.put("S", "Sí");
		listaBecado.put("N", "No");
	}
}
