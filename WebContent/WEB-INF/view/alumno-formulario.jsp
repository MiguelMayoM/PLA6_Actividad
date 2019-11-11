<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<!-- Esto ya está implícito arriba -->
		<!-- meta charset="utf-8" / -->
		<title>Escuela de Informática del SOC - Inscripción</title>
		
			<meta name="description" content="Página de Inicio de la Escuela de Informática del SOC" />
			<meta name="keywords" content="informática, estudios, escuela, PHP, JAVA, JS, .NET" />
		
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    	<meta http-equiv="X-UA-Compatible" content="ie=edge" />

			<link href="${pageContext.request.contextPath}/resources/css/estilos.css" rel="stylesheet" type="text/css" media="screen" />

			<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" /> 
			<link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet" />
			<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet"> 
						
			<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" 
				integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous" />
	</head>
	
	<body>
		<header class="hdr_ppal">
			<div class="cont_pagina">
				<h1>
					<a class="logo_link" aria-label="Inicio" href="/PLA6_Actividad">ECI SOC</a>
				</h1>
				<h2>Escuela de Ciencias Informáticas del SOC</h2>
			</div>
		</header>

		<main class="formulario">
			<div class="cont_pagina">

				<form:form action="registrado" modelAttribute="alumno">
					<h3>Formulario de inscripción</h3>
					<p>Los campos marcados con <strong><abbr title="obligatorio">*</abbr></strong> son obligatorios.</p>
						
					<section class="datos">
						<h4>Datos personales</h4>
						
						<p>
							<label for="iptNombre">Nombre (mínimo 3 caracteres):
								<strong><abbr title="obligatorio">*</abbr></strong>
							</label>	
							<form:input type="text" path="nombre" id="iptNombre" size="50" maxlength="50" placeholder="Nombre Apellidos"/>
							<form:errors path="nombre" cssClass="error" />
						</p>
						
						<p>
							<label for="iptDni">DNI (8 números (si es preciso, rellenar con ceros) y 1 letra):
							</label>
							<form:input type="text" path="dni" id="iptDni" size="9" maxlength="9" placeholder="00000000T" />			
							<form:errors path="dni" cssClass="error" />
						</p>
						
						<p>
							<label for="iptEmail">Correo eléctronico:</label>
							<!-- No le pongo type=email para que no implemente por él mismo
								mensajes de error y cambios de color del marco -->
							<form:input type="text" path="email" id="iptEmail" size="50" maxlength="50" placeholder="letras.0123456789@sitio.abc"/>
							<form:errors path="email" cssClass="error" />
						</p>
					</section>
						
					<section class="datos">
						<h4>Datos curriculares</h4>						
						
						<fieldset>
							<legend>Marque si dispone de beca
								<strong><abbr title="obligatorio">*</abbr></strong>
							:</legend>
							<!-- No preselecciono nada, pero devuelvo error si no hay nada elegido -->
							<!-- Me preocupa que en ningún sitio veo que pongan una label para
								cada opción. La forma fácil, "sin label", sería -->
							<!-- form:radiobuttons path="becado" items="${alumno.listaBecado}" /-->
							<ul>
								<c:forEach var="opcion" items="${alumno.listaBecado}">
									<li>
										<form:radiobutton path="becado" value="${opcion.value}" id="rad${opcion.key}" />
										<label for="rad${opcion.key}">${opcion.value}</label>
									</li>
								</c:forEach>
							</ul>
							<form:errors path="becado" cssClass="error" />
						</fieldset>
									
						<fieldset>
							<legend>Asignaturas que desea matricular
								<strong><abbr title="obligatorio">*</abbr></strong>
							:</legend>
							<!-- Controlar que haya una elegida, si no no hay nada que inscribir -->
							<!-- form:checkboxes path="asignaturas" items="${alumno.listaAsignaturas}" /-->
							<ul>
								<c:forEach var="opcion" items="${alumno.listaAsignaturas}">
									<li>
										<form:checkbox path="asignaturas" value="${opcion.value}" id="chx${opcion.key}" />
										<label for="chx${opcion.key}">${opcion.value}</label>
									</li>
								</c:forEach>
							</ul>
							<form:errors path="asignaturas" cssClass="error" />				
						</fieldset>
					</section>
					
					<input type="submit" value="Enviar datos" />

				</form:form>

			</div>
		</main>

		<footer>
 			<div class="cont_pagina">
				<div>
					<a class="logo_SOC-link " href="https://serveiocupacio.gencat.cat" target="_blank" rel="noopener noreferrer external" title="Ir a la página del SOC">
						<img class="SOC_logo" src="${pageContext.request.contextPath}/resources/img/logo-soc.png" alt="[logo] Servei d'Ocupació de Catalunya (SOC)" />
					</a>
				</div> 			
 			
				<address>
					Contacto: <a class="correo-link" href="mailto:asdflkj2349ehafn02hklh342898qlkehqwre@ashjlyuioyuihsdfh.com" target="_blank" rel="author noopener noreferrer" title="Envia un correo a dudasypreguntas@cienciasinformaticassoc.com">RRHH de la ECI SOC</a>
				</address> 			
 			</div>
 		</footer>
 		<div class="nota">En el navegador el pie se ve pegado al fondo. En Eclipse no...</div>	
	</body>
</html>