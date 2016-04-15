
<%@ page import="com.torneo.fifa.Partido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'partido.label', default: 'Partido')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-partido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-partido" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="partido.equipoA.label" default="Equipo A" /></th>
					
						<th><g:message code="partido.equipoB.label" default="Equipo B" /></th>
					
						<g:sortableColumn property="golA" title="${message(code: 'partido.golA.label', default: 'Gol A')}" />
					
						<g:sortableColumn property="golB" title="${message(code: 'partido.golB.label', default: 'Gol B')}" />
					
						<g:sortableColumn property="puntoA" title="${message(code: 'partido.puntoA.label', default: 'Punto A')}" />
					
						<g:sortableColumn property="puntoB" title="${message(code: 'partido.puntoB.label', default: 'Punto B')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${partidoInstanceList}" status="i" var="partidoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${partidoInstance.id}">${fieldValue(bean: partidoInstance, field: "equipoA")}</g:link></td>
					
						<td>${fieldValue(bean: partidoInstance, field: "equipoB")}</td>
					
						<td>${fieldValue(bean: partidoInstance, field: "golA")}</td>
					
						<td>${fieldValue(bean: partidoInstance, field: "golB")}</td>
					
						<td>${fieldValue(bean: partidoInstance, field: "puntoA")}</td>
					
						<td>${fieldValue(bean: partidoInstance, field: "puntoB")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${partidoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
