
<%@ page import="com.torneo.fifa.Torneo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'torneo.label', default: 'Torneo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-torneo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-torneo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="password" title="${message(code: 'torneo.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="cantidadPlayer" title="${message(code: 'torneo.cantidadPlayer.label', default: 'Cantidad Player')}" />
					
						<g:sortableColumn property="cantidadRegistrados" title="${message(code: 'torneo.cantidadRegistrados.label', default: 'Cantidad Registrados')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'torneo.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'torneo.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="fechaCreacion" title="${message(code: 'torneo.fechaCreacion.label', default: 'Fecha Creacion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${torneoInstanceList}" status="i" var="torneoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${torneoInstance.id}">${fieldValue(bean: torneoInstance, field: "password")}</g:link></td>
					
						<td>${fieldValue(bean: torneoInstance, field: "cantidadPlayer")}</td>
					
						<td>${fieldValue(bean: torneoInstance, field: "cantidadRegistrados")}</td>
					
						<td>${fieldValue(bean: torneoInstance, field: "descripcion")}</td>
					
						<td><g:formatBoolean boolean="${torneoInstance.enabled}" /></td>
					
						<td><g:formatDate date="${torneoInstance.fechaCreacion}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${torneoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
