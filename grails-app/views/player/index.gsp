
<%@ page import="com.torneo.fifa.Player" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-player" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-player" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'player.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'player.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'player.accountExpired.label', default: 'Account Expired')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'player.accountLocked.label', default: 'Account Locked')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'player.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'player.enabled.label', default: 'Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${playerInstanceList}" status="i" var="playerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${playerInstance.id}">${fieldValue(bean: playerInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: playerInstance, field: "password")}</td>
					
						<td><g:formatBoolean boolean="${playerInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${playerInstance.accountLocked}" /></td>
					
						<td>${fieldValue(bean: playerInstance, field: "apellido")}</td>
					
						<td><g:formatBoolean boolean="${playerInstance.enabled}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${playerInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
