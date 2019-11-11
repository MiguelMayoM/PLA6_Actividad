package pla6_actividad;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/alumno")
public class AlumnoFormController {
	
	@RequestMapping("/form")
	public String verFormulario(Model modelo) {
		Alumno alumno = new Alumno();
		modelo.addAttribute("alumno", alumno);
		return "alumno-formulario";
	}

	@RequestMapping("/registrado")
	public String procesarForm(
		@Valid @ModelAttribute("alumno") Alumno alumno, BindingResult bindingResult) {
	
		if(bindingResult.hasErrors()) {
			return "alumno-formulario";
		} else {
			return "alumno-registrado";
		}
	}
}