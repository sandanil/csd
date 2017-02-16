<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de Equipos</title>
<c:set var="path" value="${pageContext.request.contextPath}" scope="request" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="${path}/static/js/equipo.js"></script>

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
	
	<h1 style="color: white;">${titulo}</h1>
	<input type="button"
value="jugador" name="jugador" class="btn btn-primary" onclick="self.location.href = '/csd/jugador'" />
<input type="button"
value="federacion" name="federacion" class="btn btn-primary" onclick="self.location.href = '/csd/federacion'" />

	<table
		class="table table-hover table-condensed table-striped "style="background-color: transparent;">
		<thead>
			<tr style="font-weight:bold;font-size: large;color: yellow;text-align: center;">
				<td style="width: 10%">#</td>
				<td style="width: 20%">Nombre</td>
				<td style="width: 10%">Estadio</td>
				<td style="width: 10%">Federacion</td>
				<td style="width: 10%">Presupuesto</td>
				<td style="width: 10%">Escudo</td>
				<td style="width: 10%">Editar</td>
				<td style="width: 10%">borrar</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${equipos}" var="equipo">
				<tr style="background-color:black;font-weight:bold;font-size: large;color: white;text-align: center;" data-id="${equipo.id}">
					<td>${equipo.id}</td>
					<td><a href="<c:url value="/equipos/detalles/${equipo.id}" />">${equipo.nombre}</a></td>
					<td>${equipo.estadio}</td>
					<td>${equipo.federacion.nombre}
					
					</td>
					<td>${equipo.presupuesto}</td>
					<td><img width="100" src="${equipo.imagen}"></img></td>
					<td><button type="submit" class="btn btn-warning btn-editar">Editar</button></td>
					<td><button type="submit" class="btn btn-danger btn-confirmar-borrar">borrar</button></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">Equipos registrados: <span
					id="cantidades-equipos">${equipos.size()}</span></td>
			</tr>
			<tr>
				<td colspan="5">
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#modal-equipos">Registrar Equipos</button>
						<form action="${path}/salir" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button id="btn-salir" type="submit" class="btn btn-danger">Salir</button>
                        </form>
				</td>
			</tr>
		</tfoot>
	</table>
	<div class="modal fade" id="modal-equipos" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="form-equipos" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Informacion de equipo</h4>
					</div>
					<div class="modal-body">
							<label for="nombre">Nombre: </label> <input id="nombre"
							name="nombre" class="form-control"> 
							
							<label for="estadio">Estadio: </label> <input id="estadio"
							name="estadio" class="form-control"> 
							
							<label for="presupuesto">Presupuesto: </label> <input id="presupuesto"
							name="presupuesto" class="form-control"> 
							
							
							<label for="federacion">Federacion: </label> 
							
							
							<select id="federacion" name="federacion" class="form-control">
								
							<c:forEach items="${federaciones}" var="federacion">
								<option value="${federacion.id}">${federacion.nombre}</option>
							</c:forEach>
							</select> 
						
							<label for="nombre">Imagen: </label> 
							<input id="imagen" name="imagen" class="form-control"/>
						<input id="id" name="id" type="hidden"> 
						
						<input id="csrf" name="_csrf" type="hidden" value="${_csrf.token}">
					</div>
					<div class="modal-footer">
					
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
						<button id="btn-salvar" type="submit" class="btn btn-primary">Guardar
							Informacion</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-confirmar-borrar" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="form-confirmar-borrar" method="post">
					<div class="modal-header">
						
						<h4 class="modal-title">Borrando Equipo</h4>
					</div>
					<div class="modal-body">
												
						<input id="id-borrar" name="id" type="hidden" value=""/>						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
						<button id="btn-borrar" type="button" class="btn btn-primary">confirmar borrar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>