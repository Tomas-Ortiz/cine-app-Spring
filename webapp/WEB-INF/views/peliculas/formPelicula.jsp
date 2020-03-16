<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Crear Pelicula | Village Cines</title>

<spring:url value="/resources" var="urlPublic"></spring:url>
<spring:url value="/peliculas/save" var="urlSaveForm"></spring:url>

<link href="${urlPublic}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>

<body>

	<jsp:include page="../includes/menu.jsp"></jsp:include>


	<div class="container theme-showcase" role="main">

		<!-- ${pelicula} -->
		
		<div class="page-header">
			<h3 class="blog-title">
				<span class="label label-success">Datos de la Pelicula</span>
			</h3>
		</div>

		<!--  En caso de error de data binding en el objeto pelicula se muestra un mensaje con los errores -->
		<spring:hasBindErrors name="pelicula">
			<div class='alert alert-danger' role='alert'>
				Por favor corrija los siguientes errores:
				<ul>
					<c:forEach items="${errors.allErrors}" var="error">
						<li><spring:message message="${error}"></spring:message></li>
					</c:forEach>
				</ul>
			</div>
		</spring:hasBindErrors>

		<form:form action="${urlSaveForm}" method="post"
			enctype="multipart/form-data" modelAttribute="pelicula">

			<div class="row">
				<div class="col-sm-3">
					<div class="form-group"></div>
					<img class="img-rounded"
						src="${urlPublic}/images/${pelicula.imagen}"
						title="Imagen actual de la pel�cula" width="150" height="200">
				</div>
			</div>

			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="titulo">T�tulo</label>
						
						<!-- Se guardan los id de detalle y pelicula, para luego poder actualizarlos -->
						<form:hidden path="id" />
						<form:hidden path="detalle.id"/>
						
						<form:input type="text" class="form-control" path="titulo"
							id="titulo" required="required" />
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="duracion">Duraci�n</label>
						<form:input type="text" class="form-control" path="duracion"
							id="duracion" required="required" />
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="clasificacion" class="control-label">Clasificaci�n</label>
						<form:select id="clasificacion" path="clasificacion"
							class="form-control">
							<form:option value="A">A</form:option>
							<form:option value="B">B</form:option>
							<form:option value="C">C</form:option>
						</form:select>
					</div>
				</div>
				
				<div class="col-sm-3">
					<div class="form-group">
						<label for="genero" class="control-label">G�nero</label>
						<form:select id="genero" path="genero" class="form-control"
							items="${generos}"></form:select>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="estado" class="control-label">Estado</label>
						<form:select id="estado" path="estado" class="form-control">
							<form:option value="Activa">Activa</form:option>
							<form:option value="Inactiva">Inactiva</form:option>
						</form:select>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="fechaEstreno">Fecha de estreno</label>
						<form:input type="text" class="form-control" path="fechaEstreno"
							id="fechaEstreno" required="required" />
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="imagen">Imagen</label>
						<form:hidden path="imagen" />
						<input type="file" id="archivoImagen" name="archivoImagen" />
						<p class="help-block">Imagen de la pelicula</p>
					</div>
				</div>
			</div>


			<div class="page-header">
				<h3 class="blog-title">
					<span class="label label-success">Detalles</span>
				</h3>
			</div>

			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="director">Director</label>
						<form:input type="text" class="form-control"
							path="detalle.director" id="director" required="required" />
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="actores">Actores</label>
						<form:input type="text" class="form-control"
							path="detalle.actores" id="actores" required="required" />
					</div>
				</div>

				<div class="col-sm-6">
					<div class="form-group">
						<label for="trailer">URL del Tr�iler (Youtube)</label>
						<form:input type="text" class="form-control"
							path="detalle.trailer" id="trailer"
							placeholder="URL completa del video de YOUTUBE"
							required="required" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="sinopsis">Sin�psis</label>
						<form:textarea class="form-control" rows="5"
							path="detalle.sinopsis" id="sinopsis"></form:textarea>
					</div>
				</div>
			</div>


			<button type="submit" class="btn btn-danger">Guardar</button>
		</form:form>

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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#fechaEstreno").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>
</body>
</html>