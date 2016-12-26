<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<div align="right" id="loginHeader" class="loginHeader">
			<g:loginControl />
		</div>
		<div id="grailsLogo" role="banner">
			<a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a>
			<g:if test="${sec.loggedInUserInfo(field:'username')}">
				
				<g:link controller="torneo" action="create" class="btn btn-success">Crear Nuevo Torneo</g:link>
				<span class="btn btn-success">Mis Torneos</span>				
				<span class="btn btn-success">Mis Estadisticas</span>
				<g:link controller="Player" action="edit" id="${sec.loggedInUserInfo(field:'id')}" class="btn btn-success">Modificar Mis Datos</g:link>
			</g:if>
				
			
		</div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
