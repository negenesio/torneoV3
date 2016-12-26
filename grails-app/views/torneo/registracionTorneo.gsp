<div id='login'>
	<div class='inner'>
		<div id="registrarPlayer_div" class='fheader'>Generacion de Invitaciones al Torneo
		<br/>
		</div>
		<hr/>		
		<center><div class='informativoDestacado'><b>Seleccione los Players del torneo si conoce los usuarios de sus amigos. Los campos vacios seran registraciones disponibles</b></div></center>
		<form action='publicarTorneo' controller="torneo" method='POST' class='cssform' autocomplete='off'>
			<table>
			<thead>
				<tr>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${(1..cantidadPlayer)}" var="i">
					<tr>
						<td>
							<label>Player Nº: ${i}</label>
							<g:select id="playerInvitacion" name="playerInvitacion" from="${player_lista}" optionKey="id" optionValue="${{it.username}}" required="" value="" class="many-to-one selectPlayer" selected="true"  noSelection="['null':'INSCRIPCION ABIERTA']"  style="width: 200px"/>
						</td>
						<td><label style="display:none" class="errorRepetido">Repetido</label></td>
					</tr>
				</g:each>							
			</tbody>
			</table>
				<p>
					<g:link class="btn btn-default" action="indexPlayer" controller="player">Cancelar</g:link>
					<input type='submit' id="test" class="btn btn-default" value='Publicar Torneo' onclick="validarRegistracion(); checkInput();"/>
				</p>
		</form>
	</div>
	</center>
</div>