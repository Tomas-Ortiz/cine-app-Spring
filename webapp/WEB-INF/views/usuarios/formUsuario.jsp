<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="">
<title>Crear usuario | Village Cines</title>
<spring:url value="/resources" var="urlPublic"></spring:url>
<spring:url value="/usuarios/save" var="urlSave"></spring:url>

<link href="${urlPublic}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">
</head>

<body>

	<jsp:include page="../includes/menu.jsp"></jsp:include>

	<div class="container theme-showcase" role="main">

		<h3 class="blog-title">
			<span class="label label-success">Datos del Usuario</span>
		</h3>

		<c:if test="${mensaje != null}">
			<div class='alert alert-danger' role="alert">${ mensaje }</div>
		</c:if>

		<form:form action="${urlSave}" method="post" modelAttribute="usuario">
			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="perfil" class="control-label">Perfil</label> <select
							id="perfil" name="perfil" class="form-control">
							<option value="EDITOR">EDITOR</option>
							<option value="GERENTE">GERENTE</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="cuenta">Usuario</label>
						<form:input type="text" class="form-control" path="username"
							id="username" placeholder="Usuario" required="required" />
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="pwd">Contraseña</label>
						<form:input type="password" class="form-control" path="password"
							id="password" placeholder="Contraseña" required="required" />
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="email">Email</label>
						<form:input type="text" class="form-control" path="email"
							id="email" placeholder="Correo electrónico" required="required" />
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="telefono">Teléfono</label>
						<form:input type="text" class="form-control" path="telefono"
							id="telefono" required="required" placeholder="Teléfono" />
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
</body>
</html>
