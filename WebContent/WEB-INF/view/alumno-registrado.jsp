<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<title>Escuela de Informática del SOC - Alumno registrado</title>
		
			<meta name="description" content="Página de Inicio de la Escuela de Informática del SOC" />
			<meta name="keywords" content="informática, estudios, escuela, PHP, JAVA, JS, .NET" />
		
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    	<meta http-equiv="X-UA-Compatible" content="ie=edge" />

			<link href="${pageContext.request.contextPath}/resources/css/estilos.css" rel="stylesheet" type="text/css" media="screen" />

			<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" /> 
			<link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet" />
						
			<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous" />
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

		<main class="registrado">
			<div class="cont_pagina">
			
				<h3>Nuevo alumno registrado</h3>

				<section class="datos">
					<h4>Datos personales</h4>
					<p>
						<span>Nombre:</span>	
						<span>${alumno.nombre}</span>
					</p>

					<p>
						<span>DNI:</span>
						<span>${alumno.dni}</span>
					</p>

					<p>
						<span>email:</span>
						<span>${alumno.email}</span>
					</p>

				</section>
						
				<section class="datos">
					<h4>Datos curriculares</h4>							

					<p>
						<span>Becado:</span>	
						<span>${alumno.becado}</span>
					</p>
					
					<div>
						<span>Asignaturas inscritas:</span>	
						<ul>
							<c:forEach var="asignatura" items="${alumno.asignaturas}">
								<li>${asignatura}</li>
							</c:forEach>
						</ul>				
					</div>
				</section>	
							
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
 		<div class="nota">En el navegador el pie se ve pegado al fondo</div>	
	</body>
</html>