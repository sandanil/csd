<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detalles de Equipos</title>
<c:set var="path" value="${pageContext.request.contextPath}" scope="request" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="${path}/static/js/jugador.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
<body style="background: url('http://7www.ecestaticos.com/imagestatic/clipping/c79/81b/c7981b0ebc81db95f42ae6ad8d0a0f48/la-supercopa-de-espana-en-directo.jpg?mtime=1471360566');">
<h1 style="color: white;">Detalles de Equipo</h1>
<table
		class="table table-hover table-condensed table-striped table-bordered">
		<thead>
			<tr style="font-weight:bold;font-size: large;color: yellow;text-align: center; ">
				<td style="width: 10%">#</td>
				<td style="width: 20%">Nombre</td>
				<td style="width: 10%">Estadio</td>
				<td style="width: 10%">Federacion</td>
				<td style="width: 10%">Presupuesto</td>
				<td style="width: 10%">Escudo</td>
			</tr>
		</thead>
		<tbody>
			
				<tr style="background-color:transparent; font-weight:bold;font-size: large;color: white;text-align: center;" data-id="${jugador.id}">
					<td>${equipo.id}</td>
					<td>${equipo.nombre}</td>
					<td>${equipo.estadio}</td>
					<td>${equipo.federacion.nombre}</td>
					<td>${equipo.presupuesto}</td>
					<td><img width="100" src="${equipo.imagen}"></img></td>
					
				</tr>
			
		</tbody>
	</table>
	
	<input type="button" value="Listado de Equipos" name="equipos" class="btn btn-primary" onclick="self.location.href = '/csd/equipos'" />
</body>
</html>