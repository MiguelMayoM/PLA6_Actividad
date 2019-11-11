package pla6_actividad.validacion;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class ValidarDniLetra implements ConstraintValidator<ValidarDni, String> {
		
	@Override
	public void initialize(ValidarDni dni) {	
	}
		
	@Override
	public boolean isValid(String dni, ConstraintValidatorContext cxt) {
		boolean valido = false;
		char[] letraDni = {'T', 'R', 'W', 'A', 'G', 'M', 'Y', 'F', 'P', 'D', 'X',	'B',
											 'N', 'J', 'Z', 'S', 'Q', 'V', 'H', 'L', 'C', 'K', 'E'};
		/* Como no se ha pedido que el DNI sea obligatorio, damos por válida una
		 * cadena vacía*/
		if (dni.replace(" ","").equals("")) return true;
				
		/* También podría validar este patrón fuera en la clase con @Pattern y mirar
		 *  aquí sólo la letra*/
		Pattern pat = Pattern.compile("[0-9]{8}[A-Za-z]");
		/* Quisiera dar dos tipos de mensajes: uno si el formato es incorrecto y el
		 * otro si es la letra la que no se corresponde con el número*/
		Matcher mat = pat.matcher(dni);
			
		if (mat.matches()) {
			char letra = Character.toUpperCase(dni.charAt(8));
			int numdni = Integer.parseInt(dni.substring(0,8));
			valido = letra == letraDni[numdni % 23];
			
			/* Si el formato es el correcto (8 números + 1 letra), pero la letra no es
			 * la que toca al número, lo indicaré cambiando el mensaje para mejorar
			 * la usabilidad de la página*/
			if(letra != letraDni[numdni % 23]) {
				cxt.disableDefaultConstraintViolation();
				cxt.buildConstraintViolationWithTemplate("La letra no coincide con el número facilitado")
					.addConstraintViolation();
			}	
		}
		return valido;
	}
}