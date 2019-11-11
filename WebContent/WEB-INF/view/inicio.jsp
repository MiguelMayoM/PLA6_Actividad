<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- Para incluir archivos CSS y JS he leído tres formas. Las dos primeras
		 requieren una declaración aquí arriba y luego su uso mediante etiquetas
		 abajo:
		 1. Spring tags (Quitar !-- y --, dejando los %) -->
				<!--%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%-->
<!-- 2. JSTL. Pondré comentada abajo las etiquetas respectivas pero aquí no
				comento esta declaración porque la usaré para un bucle de los elementos
				de una lista <ul> -->
				<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 3. Page Context Variable.Es la forma que usaré. No requiere línea aquí arriba -->	

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Escuela de Informática del SOC</title>
		
			<meta name="description" content="Página de Inicio de la Escuela de Informática del SOC" />
			<meta name="keywords" content="informática, estudios, escuela, PHP, JAVA, JS, .NET" />
		
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
		
			<!-- 1. Spring tags -->
			<!--spring:url value="/resources/css/estilos.css" var="archivoCSS" />
			<link href="${archivoCSS}" rel="stylesheet" /-->		
			
			<!-- 2. JSTL -->
			<!-- link href="<c:url value="/resources/css/estilos.css" />" rel="stylesheet" 
						type="text/css" media="screen" -->
			
			<!-- 3. Con Page Context Variable -->
			<link href="${pageContext.request.contextPath}/resources/css/estilos.css" rel="stylesheet" type="text/css" media="screen" />
			
			<!-- Lo mismo para JS, pongo un ejemplo con JSTL, también en carpeta /resources -->
			<!-- script src="<c:url value="/resources/js/main.js" />"></script-->		
		
			<!-- Fuentes varias -->
			<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" /> 
			<link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet" />
			<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet"> 

			<!-- Iconos font-awesome -->
			<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous" />
	</head>
	
	<body>
		<header class="hdr_ppal">
			<div class="cont_pagina">
				<h1>ECI SOC</h1>
				<h2>Escuela de Ciencias Informáticas del SOC</h2>
			</div>
		</header>

		<main>
			<div class="cont_pagina">
				<section>
					<header>
						<h3>Presentación</h3>
					</header>
			
					<p>Bienvenidos a la escuela de Ciencias Informáticas del SOC. Cada
						 nuevo curso, nuestra preocupación es ofrecer los máximos estándares
						 de calidad a nuestros alumnos.
					</p>
					<p>El presente curso incorporamos una nueva asignatura a nuestro
						 plan docente: Java. 
					</p>
				</section>
			
				<section>				 
					<header>
						<h3>Asignaturas</h3>
					</header>
			 
			 		<p>La oferta de asignaturas para este curso 2019-2020 es la siguiente:</p>
			 		<ul>
						<c:forEach var="asignatura" items="${asignaturas}">
							<li>${asignatura.asignatura}</li>
						</c:forEach>			
					</ul>
				</section>
				
				<section>
					<header>
						<h3>Nuevos alumnos</h3>
					</header>
			 
			 		<p>Si quieres mejorar tu CV de estudios con nosotros, puedes inscribirte en el siguiente enlace:
			 			<!-- OJO!!! NO HAY QUE PONER /alumno/form 
			 					 SI NO, INTERPRETA QUE ES LA RAÍZ Y NO ENCUENTRA NADA!!!!! NO HACE "/PLA6_Actividad/alumno/form" -->
			 			<a class="formulario_link" href="alumno/form">Formulario de inscripción
			 				<span class="fas fa-external-link-alt"></span>
			 			</a>
			 		</p>				
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
 		<div class="nota">En el navegador el pie se ve pegado al fondo. En Eclipse no...</div>	
	</body>
</html>