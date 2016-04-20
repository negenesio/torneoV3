<%@ page import="com.torneo.fifa.Player" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Principal</title>
	</head>
	<body>
		<div id="edit-player" class="content scaffold-edit" role="main">
			<h1>Mis Acciones</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test='${flash.params.error}'>
				<div class='message'>${flash.params.error}</div>
			</g:if>
			<g:if test="${flash.params.info}">
				<div class="message" role="status">${flash.params.info}</div>
			</g:if>
			
		<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'username', 'error')} required">
			<label>Crear Nuevo Torneo</label>
			<br/>
			<label>Mis Torneos</label>
			<br/>
			<label>Mis Estadisticas</label>
			<br/>
			<label>Modificar Mis Datos</label>
		</div>
		</div>
	</body>
</html>
