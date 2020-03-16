<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Acerca | Village Cines</title>
<spring:url value="/resources" var="urlPublic"></spring:url>

<link href="${urlPublic}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">

</head>

<body>

	<jsp:include page="includes/menu.jsp"></jsp:include>

	<div class="container theme-showcase" role="main">

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><b>Acerca de Cinépolis</b></h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-sm-3">
						<p class="text-center">
							<img class="img-rounded" src="${urlPublic}/images/cinepolis.jpg"
								alt="Generic placeholder image" height="220">
						</p>
					</div>
					<div class="col-sm-9">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title"><b>Detalles</b></h3>
							</div>
							<div class="panel-body">Cinépolis es una empresa mexicana
								con el objetivo de crear un verdadero valor de diversión,
								comodidad y entretenimiento para sus clientes. Fundada en
								Morelia en 1971, es líder de la industria cinematográfica y del
								entretenimiento en México y Latinoamérica. Cinépolis es la
								cuarta cadena más grande a nivel mundial, la segunda más grande
								en venta de entradas, la primera en entradas vendidos por sala y
								la más importante fuera de los Estados Unidos. Además, es el
								operador de salas VIP más grande del mundo.</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="includes/footer.jsp"></jsp:include>

		<!-- /container -->

		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>