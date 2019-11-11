package pla6_actividad;

/*Hasta que no leamos los valores de una BD, como los voy a utilizar en más
  de un lugar, los presento aquí*/
public enum Asignaturas {
	PHP("PHP"), JAVA("Java"), JS("JS"), NET(".NET");
	
	private final String asignatura;
	Asignaturas(String strA) {asignatura = strA;} 
	public String getAsignatura() {return asignatura;}
}