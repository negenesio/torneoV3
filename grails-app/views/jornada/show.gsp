
<%@ page import="com.torneo.fifa.Jornada" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'jornada.label', default: 'Jornada')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-jornada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-jornada" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list jornada">
			
				<g:if test="${jornadaInstance?.equipoA}">
				<li class="fieldcontain">
					<span id="equipoA-label" class="property-label"><g:message code="jornada.equipoA.label" default="Equipo A" /></span>
					
						<span class="property-value" aria-labelledby="equipoA-label"><g:link controller="player" action="show" id="${jornadaInstance?.equipoA?.id}">${jornadaInstance?.equipoA?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${jornadaInstance?.equipoB}">
				<li class="fieldcontain">
					<span id="equipoB-label" class="property-label"><g:message code="jornada.equipoB.label" default="Equipo B" /></span>
					
						<span class="property-value" aria-labelledby="equipoB-label"><g:link controller="player" action="show" id="${jornadaInstance?.equipoB?.id}">${jornadaInstance?.equipoB?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${jornadaInstance?.torneoRegistracion}">
				<li class="fieldcontain">
					<span id="torneo" class="property-label"><g:message code="jornada.torneoRegistracion.label" default="Torneo Registracion" /></span>
					
						<span class="property-value" aria-labelledby="torneoRegistracion-label"><g:link controller="torneoRegistracion" action="show" id="${jornadaInstance?.torneoRegistracion?.id}">${jornadaInstance?.torneoRegistracion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:jornadaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${jornadaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
