<%@ page import="com.torneo.fifa.Torneo" %>

<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="torneo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" id="nombre" required="" value="${torneoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'cantidadPlayer', 'error')} required">
	<label for="cantidadPlayer">
		<g:message code="torneo.cantidadPlayer.label" default="Cantidad Player" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidadPlayer" id="cantidadPlayer" type="number" value="${2}" min="2" max="32" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="torneo.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<textArea  name="descripcion" id="descripcion" required="" value="${torneoInstance?.descripcion}"></textArea>
</div>


<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="torneo.password.label" default="Password" />
	</label>
	<g:textField name="password" id="password" value="${torneoInstance?.password}"/>
</div>



<%--<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'cantidadRegistrados', 'error')} required">--%>
<%--	<label for="cantidadRegistrados">--%>
<%--		<g:message code="torneo.cantidadRegistrados.label" default="Cantidad Registrados" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:field name="cantidadRegistrados" id="cantidadRegistrados" type="number" value="${torneoInstance.cantidadRegistrados}" required=""/>--%>
<%----%>
<%--</div>--%>

<%--<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'enabled', 'error')} ">--%>
<%--	<label for="enabled">--%>
<%--		<g:message code="torneo.enabled.label" default="Enabled" />--%>
<%--		--%>
<%--	</label>--%>
<%--	<g:checkBox name="enabled" value="${torneoInstance?.enabled}" />--%>
<%----%>
<%--</div>--%>

<%--<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'fechaCreacion', 'error')} required">--%>
<%--	<label for="fechaCreacion">--%>
<%--		<g:message code="torneo.fechaCreacion.label" default="Fecha Creacion" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:datePicker name="fechaCreacion" precision="day"  value="${torneoInstance?.fechaCreacion}"  />--%>
<%----%>
<%--</div>--%>

<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="torneo.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select disabled id="owner" name="owner.id" from="${com.torneo.fifa.Player.list()}" optionKey="id" required="" optionValue="${{it.username}}" value="${sec.loggedInUserInfo(field:'id')}"  class="many-to-one"/>

</div>

<%--<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'players', 'error')} ">--%>
<%--	<label for="players">--%>
<%--		<g:message code="torneo.players.label" default="Players" />--%>
<%--		--%>
<%--	</label>--%>
<%--	<g:select name="players" from="${com.torneo.fifa.Player.list()}" multiple="multiple" optionKey="id" size="5" value="${torneoInstance?.players*.id}" class="many-to-many"/>--%>
<%----%>
<%--</div>--%>

<%--<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'publicado', 'error')} ">--%>
<%--	<label for="publicado">--%>
<%--		<g:message code="torneo.publicado.label" default="Publicado" />--%>
<%--		--%>
<%--	</label>--%>
<%--	<g:checkBox name="publicado" value="${torneoInstance?.publicado}" />--%>
<%----%>
<%--</div>--%>

