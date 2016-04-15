<%@ page import="com.torneo.fifa.Partido" %>



<div class="fieldcontain ${hasErrors(bean: partidoInstance, field: 'equipoA', 'error')} required">
	<label for="equipoA">
		<g:message code="partido.equipoA.label" default="Equipo A" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="equipoA" name="equipoA.id" from="${com.torneo.fifa.Player.list()}" optionKey="id" required="" value="${partidoInstance?.equipoA?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partidoInstance, field: 'equipoB', 'error')} required">
	<label for="equipoB">
		<g:message code="partido.equipoB.label" default="Equipo B" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="equipoB" name="equipoB.id" from="${com.torneo.fifa.Player.list()}" optionKey="id" required="" value="${partidoInstance?.equipoB?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partidoInstance, field: 'golA', 'error')} required">
	<label for="golA">
		<g:message code="partido.golA.label" default="Gol A" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="golA" type="number" value="${partidoInstance.golA}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: partidoInstance, field: 'golB', 'error')} required">
	<label for="golB">
		<g:message code="partido.golB.label" default="Gol B" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="golB" type="number" value="${partidoInstance.golB}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: partidoInstance, field: 'puntoA', 'error')} required">
	<label for="puntoA">
		<g:message code="partido.puntoA.label" default="Punto A" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="puntoA" type="number" value="${partidoInstance.puntoA}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: partidoInstance, field: 'puntoB', 'error')} required">
	<label for="puntoB">
		<g:message code="partido.puntoB.label" default="Punto B" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="puntoB" type="number" value="${partidoInstance.puntoB}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: partidoInstance, field: 'torneo', 'error')} required">
	<label for="torneo">
		<g:message code="partido.torneo.label" default="Torneo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="torneo" name="torneo.id" from="${com.torneo.fifa.Torneo.list()}" optionKey="id" required="" value="${partidoInstance?.torneo?.id}" class="many-to-one"/>

</div>

