<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
</head>
<body>
<div id='login'>
	<div class='inner'>
		<div class='fheader'>Generacion de Invitaciones al Torneo
			<br/>
		</div>
		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>
		<g:if test='${flash.params.error}'>
			<div class='login_message'>${params.mensaje}</div>
		</g:if>
		<g:if test='${flash.params.info}'>
			<div class='message'>${params.info}</div>
		</g:if>
		<g:if test='${flash.params.nuevoCodigo}'>
			<div class='message'>Enviar Nuevo Codigo</div>
		</g:if>
		
			<ol class="property-list torneo">
			
				<g:if test="${torneoInstance.password}">
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
					<span class="property-value" aria-labelledby="fechaCreacion-label"><g:formatDate date="${torneoInstance?.fechaCreacion}" format="dd-MM-yyyy"/></span>					
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
					<span class="property-value" aria-labelledby="owner-label">${torneoInstance?.owner?.username}</span>
				</li>
				</g:if>			
			</ol>

		<form action='publicarTorneo' controller="torneo" method='POST' class='cssform' autocomplete='off'>
		<hr/>
		<br/>
		<center><div class='informativoDestacado'><b>Seleccione los Players del torneo si conoce los usuarios de sus amigos. Los campos vacios seran registraciones disponibles</b></div></center>
		<table>
		<thead>
			<tr>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${(1..torneoInstance.cantidadPlayer)}" var="i">
				<tr>
					<td>
						<label>Player Nº: ${i}</label>
						<g:select id="playerInvitacion" name="playerInvitacion" from="${player_lista}" optionKey="id" optionValue="${{it.username}}" required="" value="" class="many-to-one" selected="true"  noSelection="['null':'']"  style="width: 200px"/>
					</td>
				</tr>
			</g:each>							
		</tbody>
		</table>
			<input type="hidden" name="torneoInstance" value="${torneoInstance.id}"/>
			<p>
				<g:link class="btn btn-default" action="indexPlayer" controller="player">Cancelar</g:link>
				<input type='submit' id="submit" class="btn btn-default" value='Publicar Torneo' onclick="waitingDialog.show('Cargando...', {dialogSize: 'sm', progressType: 'success'});"/>
			</p>
		</form>
	</div>
</div>
</body>
</html>

