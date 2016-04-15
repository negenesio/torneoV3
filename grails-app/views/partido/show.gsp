
<%@ page import="com.torneo.fifa.Partido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'partido.label', default: 'Partido')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-partido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-partido" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list partido">
			
				<g:if test="${partidoInstance?.equipoA}">
				<li class="fieldcontain">
					<span id="equipoA-label" class="property-label"><g:message code="partido.equipoA.label" default="Equipo A" /></span>
					
						<span class="property-value" aria-labelledby="equipoA-label"><g:link controller="player" action="show" id="${partidoInstance?.equipoA?.id}">${partidoInstance?.equipoA?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${partidoInstance?.equipoB}">
				<li class="fieldcontain">
					<span id="equipoB-label" class="property-label"><g:message code="partido.equipoB.label" default="Equipo B" /></span>
					
						<span class="property-value" aria-labelledby="equipoB-label"><g:link controller="player" action="show" id="${partidoInstance?.equipoB?.id}">${partidoInstance?.equipoB?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${partidoInstance?.golA}">
				<li class="fieldcontain">
					<span id="golA-label" class="property-label"><g:message code="partido.golA.label" default="Gol A" /></span>
					
						<span class="property-value" aria-labelledby="golA-label"><g:fieldValue bean="${partidoInstance}" field="golA"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partidoInstance?.golB}">
				<li class="fieldcontain">
					<span id="golB-label" class="property-label"><g:message code="partido.golB.label" default="Gol B" /></span>
					
						<span class="property-value" aria-labelledby="golB-label"><g:fieldValue bean="${partidoInstance}" field="golB"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partidoInstance?.puntoA}">
				<li class="fieldcontain">
					<span id="puntoA-label" class="property-label"><g:message code="partido.puntoA.label" default="Punto A" /></span>
					
						<span class="property-value" aria-labelledby="puntoA-label"><g:fieldValue bean="${partidoInstance}" field="puntoA"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partidoInstance?.puntoB}">
				<li class="fieldcontain">
					<span id="puntoB-label" class="property-label"><g:message code="partido.puntoB.label" default="Punto B" /></span>
					
						<span class="property-value" aria-labelledby="puntoB-label"><g:fieldValue bean="${partidoInstance}" field="puntoB"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partidoInstance?.torneo}">
				<li class="fieldcontain">
					<span id="torneo-label" class="property-label"><g:message code="partido.torneo.label" default="Torneo" /></span>
					
						<span class="property-value" aria-labelledby="torneo-label"><g:link controller="torneo" action="show" id="${partidoInstance?.torneo?.id}">${partidoInstance?.torneo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:partidoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${partidoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
