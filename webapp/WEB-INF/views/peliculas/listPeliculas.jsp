<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Lista de Peliculas | Village Cines</title>

<spring:url value="/resources" var="urlPublic"></spring:url>
<spring:url value="/peliculas/create" var="urlNueva"></spring:url>
<spring:url value="/peliculas/edit" var="urlEdit"></spring:url>
<spring:url value="/peliculas/delete" var="urlDelete"></spring:url>
<spring:url value="/peliculas" var="urlPeliculas"></spring:url>
<spring:url value="/peliculas/orderBy" var="urlOrder"></spring:url>

<link href="${urlPublic}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">
<link href="${urlPublic}/css/tabla.css" rel="stylesheet">

</head>

<body>

	<jsp:include page="../includes/menu.jsp"></jsp:include>

	<div class="container theme-showcase" role="main">

		<h3>Listado de Peliculas</h3>

		<c:if test="${mensaje != null}">
			<div class='alert alert-success' role="alert">${ mensaje }</div>
		</c:if>

		<a href="${urlNueva}" class="btn btn-success" role="button"
			title="Nueva Pelicula">Nueva</a><br> <br>

		<form class="form-inline" action="${urlOrder}" method="post">
			<div class="form-group">
				<label for="ordenarPor">Ordenar por: </label> 
				<select id="ordenarPor" name="ordenarPor" class="form-control">
					<c:forEach items="${ordenamientos}" var="ordenamiento">
						<c:choose>

							<c:when test="${ordenadoPor == ordenamiento }">
								<option value="${ordenamiento}" selected>${ordenamiento}</option>
							</c:when>

							<c:otherwise>
								<option value="${ordenamiento}">${ordenamiento}</option>
							</c:otherwise>

						</c:choose>
					</c:forEach>
				</select>

			</div>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

			<button type="submit" class="btn btn-primary">Ordenar</button>
		</form>
		<p class="text-right">
			<i>${cantResultados} resultados</i>
		</p>

		<div class="table-responsive">
			<table class="table table-hover table-striped table-bordered">
				<tr>
					<th>Titulo</th>
					<th>Género</th>
					<th>Clasificación</th>
					<th>Duración</th>
					<th>Fecha Estreno</th>
					<th>Estado</th>
					<th>Opciones</th>
				</tr>
				<!-- peliculas es una coleccion de tipo Page, para recorrerlo se llama al metodo content  -->
				<!--  el metodo content devuelve un tipo List  -->
				<c:forEach items="${peliculas.content}" var="pelicula">
					<tr>
						<td>${pelicula.titulo}</td>
						<td>${pelicula.genero}</td>
						<td>${pelicula.clasificacion}</td>
						<td>${pelicula.duracion} min.</td>
						<td><fmt:formatDate value="${pelicula.fechaEstreno}"
								pattern="dd-MM-yyyy" /></td>
						<c:choose>
							<c:when test="${pelicula.estado == 'Activa'}">
								<td><span class="label label-success">${pelicula.estado}</span></td>
							</c:when>
							<c:otherwise>
								<td><span class="label label-danger">${pelicula.estado}</span></td>
							</c:otherwise>
						</c:choose>

						<td>
						<a href="${urlEdit}/${pelicula.id}"
							class="btn btn-success btn-sm" role="button" title="Edit">
							<span class="glyphicon glyphicon-pencil"></span>
							</a> 
								
								<a href="${urlDelete}/${pelicula.id}"
							onclick='return confirm("¿Estás seguro que deseas eliminar la pelicula?")'
							class="btn btn-danger btn-sm" role="button" title="Eliminar"><span
								class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
			</table>

			<!-- Paginacion: anterior y siguiente -->
			<!-- peliculas es el nombre agregado al model -->
			<!-- la propiedad number devuelve el numero de pagina para la coleccion de tipo Page -->
			<nav aria-label="">
				<ul class="pager">
					<li><a
						href="${urlPeliculas}/index?page=${peliculas.number - 1 }">Anterior</a></li>

					<c:choose>
						<c:when test="${bloqueado == true}">
							<li><a style="pointer-events: none; background: silver;"
								href="${urlPeliculas}/index?page=${peliculas.number + 1 }">Siguiente</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="${urlPeliculas}/index?page=${peliculas.number + 1 }">Siguiente</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>

		</div>

		<hr class="featurette-divider">

		<jsp:include page="../includes/footer.jsp"></jsp:include>


	</div>
	<!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>