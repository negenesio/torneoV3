<%@ page import="com.torneo.fifa.Jornada" %>



<div class="fieldcontain ${hasErrors(bean: jornadaInstance, field: 'equipoA', 'error')} required">
	<label for="equipoA">
		<g:message code="jornada.equipoA.label" default="Equipo A" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="equipoA" name="equipoA.id" from="${com.torneo.fifa.Player.list()}" optionKey="id" required="" value="${jornadaInstance?.equipoA?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: jornadaInstance, field: 'equipoB', 'error')} required">
	<label for="equipoB">
		<g:message code="jornada.equipoB.label" default="Equipo B" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="equipoB" name="equipoB.id" from="${com.torneo.fifa.Player.list()}" optionKey="id" required="" value="${jornadaInstance?.equipoB?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: jornadaInstance, field: 'torneo', 'error')} required">
	<label for="torneo">
		<g:message code="jornada.torneo.label" default="Torneo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="torneo" name="torneo.id" from="${com.torneo.fifa.Torneo.list()}" optionKey="id" required="" value="${jornadaInstance?.torneo?.id}" class="many-to-one"/>

</div>

