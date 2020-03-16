<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- tags para spring security -->
<!--  3 menus diferentes: anonimo, editor y gerente -->
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<spring:url value="/" var="urlRoot"></spring:url>


<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">

		<!-- El menu se muestra de forma dinamica, segun el rol asociado -->
		<!--  MENU 1: Anonimo -->
		<sec:authorize access="isAnonymous()">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${urlRoot}">Village Cines</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="${urlRoot}contact">Contacto</a></li>
					<li><a href="${urlRoot}about">Acerca</a></li>
					<li><a href="${urlRoot}login">Acceder</a></li>
				</ul>
			</div>
		</sec:authorize>

		<!--  MENU 2: Editor -->
		<sec:authorize access="hasAnyAuthority('EDITOR')">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${urlRoot}admin/index">Village
					Cines | Administración</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<!-- Se busca la primera pagina (0) por default -->
					<li><a href="${urlRoot}peliculas/index?page=0">Peliculas</a></li>
					<li><a href="${urlRoot}horarios/index?page=0">Horarios</a></li>
					<li><a href="${urlRoot}noticias/index?page=0">Noticias</a></li>
					<li><a href="${urlRoot}admin/logout">Cerrar Sesión</a></li>
				</ul>
			</div>
		</sec:authorize>


		<!-- MENU 3: Gerente -->
		<sec:authorize access="hasAnyAuthority('GERENTE')">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${urlRoot}admin/index">Village
					Cines | Administración</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<!-- Se busca la primera pagina (0) por default -->
					<li><a href="${urlRoot}peliculas/index?page=0">Peliculas</a></li>
					<li><a href="${urlRoot}banners/index?page=0">Banners</a></li>
					<li><a href="${urlRoot}horarios/index?page=0">Horarios</a></li>
					<li><a href="${urlRoot}noticias/index?page=0">Noticias</a></li>
					<li><a href="${urlRoot}usuarios/create">Usuarios</a></li>
					<li><a href="${urlRoot}admin/logout">Cerrar Sesión</a></li>
				</ul>
			</div>
		</sec:authorize>

	</div>
</nav>