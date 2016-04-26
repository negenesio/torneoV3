
<%@ page import="com.torneo.fifa.TorneoRegistracion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'torneoRegistracion.label', default: 'TorneoRegistracion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-torneoRegistracion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-torneoRegistracion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="cantidadRegistrados" title="${message(code: 'torneoRegistracion.cantidadRegistrados.label', default: 'Cantidad Registrados')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'torneoRegistracion.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="fechaCreacion" title="${message(code: 'torneoRegistracion.fechaCreacion.label', default: 'Fecha Creacion')}" />
					
						<th><g:message code="torneoRegistracion.torneo.label" default="Torneo" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${torneoRegistracionInstanceList}" status="i" var="torneoRegistracionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${torneoRegistracionInstance.id}">${fieldValue(bean: torneoRegistracionInstance, field: "cantidadRegistrados")}</g:link></td>
					
						<td><g:formatBoolean boolean="${torneoRegistracionInstance.enabled}" /></td>
					
						<td><g:formatDate date="${torneoRegistracionInstance.fechaCreacion}" /></td>
					
						<td>${fieldValue(bean: torneoRegistracionInstance, field: "torneo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${torneoRegistracionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
