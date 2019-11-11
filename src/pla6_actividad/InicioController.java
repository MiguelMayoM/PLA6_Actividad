package pla6_actividad;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InicioController {
	@RequestMapping("/")
	/* Voy a presentar la asignaturas también en la pantalla de inicio. Las tengo
	 * guardadas en un enum, cargo sus valores y luego itero sobre ellos en la jsp */
	public String verPaginaInicio(Model modelo) {
		modelo.addAttribute("asignaturas", Asignaturas.values());
		return "inicio";
	}
}