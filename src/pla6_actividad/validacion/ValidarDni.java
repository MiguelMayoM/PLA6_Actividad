package pla6_actividad.validacion;

/*Es para los javadocs... Eclipse la incluye pero creo que no es necesaria*/
//import java.lang.annotation.Documented;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

//@Documented
@Constraint(validatedBy = ValidarDniLetra.class)
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidarDni {
	/* Este es el mensaje general, pero lo cambiaré si se da la situación específica
	 * de que el formato es el correcto de 8 números y 1 letra pero que es la letra
	 * la que no está bien anotada*/
	String message() default "DNI no válido";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default {};
}