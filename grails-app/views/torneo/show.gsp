
<%@ page import="com.torneo.fifa.Torneo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'torneo.label', default: 'Torneo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-torneo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<sec:ifAllGranted roles="ROLE_ADMIN"><li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li></sec:ifAllGranted>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-torneo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list torneo">
			
				<g:if test="${torneoInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="torneo.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${torneoInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${torneoInstance?.cantidadPlayer}">
				<li class="fieldcontain">
					<span id="cantidadPlayer-label" class="property-label"><g:message code="torneo.cantidadPlayer.label" default="Cantidad Player" /></span>
					
						<span class="property-value" aria-labelledby="cantidadPlayer-label"><g:fieldValue bean="${torneoInstance}" field="cantidadPlayer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${torneoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="torneo.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${torneoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${torneoInstance?.fechaCreacion}">
				<li class="fieldcontain">
					<span id="fechaCreacion-label" class="property-label"><g:message code="torneo.fechaCreacion.label" default="Fecha Creacion" /></span>
					
						<span class="property-value" aria-labelledby="fechaCreacion-label"><g:formatDate date="${torneoInstance?.fechaCreacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${torneoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="torneo.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${torneoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${torneoInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="torneo.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="player" action="show" id="${torneoInstance?.owner?.id}">${torneoInstance?.owner?.username}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:torneoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<sec:ifAllGranted roles="ROLE_ADMIN"><g:link class="edit" action="edit" resource="${torneoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></sec:ifAllGranted>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
