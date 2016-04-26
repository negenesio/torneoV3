
<%@ page import="com.torneo.fifa.TorneoRegistracion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'torneoRegistracion.label', default: 'TorneoRegistracion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-torneoRegistracion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-torneoRegistracion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list torneoRegistracion">
			
				<g:if test="${torneoRegistracionInstance?.cantidadRegistrados}">
				<li class="fieldcontain">
					<span id="cantidadRegistrados-label" class="property-label"><g:message code="torneoRegistracion.cantidadRegistrados.label" default="Cantidad Registrados" /></span>
					
						<span class="property-value" aria-labelledby="cantidadRegistrados-label"><g:fieldValue bean="${torneoRegistracionInstance}" field="cantidadRegistrados"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${torneoRegistracionInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="torneoRegistracion.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${torneoRegistracionInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${torneoRegistracionInstance?.fechaCreacion}">
				<li class="fieldcontain">
					<span id="fechaCreacion-label" class="property-label"><g:message code="torneoRegistracion.fechaCreacion.label" default="Fecha Creacion" /></span>
					
						<span class="property-value" aria-labelledby="fechaCreacion-label"><g:formatDate date="${torneoRegistracionInstance?.fechaCreacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${torneoRegistracionInstance?.players}">
				<li class="fieldcontain">
					<span id="players-label" class="property-label"><g:message code="torneoRegistracion.players.label" default="Players" /></span>
					
						<g:each in="${torneoRegistracionInstance.players}" var="p">
						<span class="property-value" aria-labelledby="players-label"><g:link controller="player" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${torneoRegistracionInstance?.torneo}">
				<li class="fieldcontain">
					<span id="torneo-label" class="property-label"><g:message code="torneoRegistracion.torneo.label" default="Torneo" /></span>
					
						<span class="property-value" aria-labelledby="torneo-label"><g:link controller="torneo" action="show" id="${torneoRegistracionInstance?.torneo?.id}">${torneoRegistracionInstance?.torneo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:torneoRegistracionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${torneoRegistracionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
