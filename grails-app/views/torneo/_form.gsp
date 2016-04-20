<%@ page import="com.torneo.fifa.Torneo" %>

<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="torneo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${torneoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'cantidadPlayer', 'error')} required">
	<label for="cantidadPlayer">
		<g:message code="torneo.cantidadPlayer.label" default="Cantidad Player" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidadPlayer" type="number" min="1" value="1" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="torneo.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea style="resize:none" name="descripcion" required="" value="${torneoInstance?.descripcion}"/>
</div>

<div style="display:none" class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'fechaCreacion', 'error')} required">
	<label for="fechaCreacion">
		<g:message code="torneo.fechaCreacion.label" default="Fecha Creacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${torneoInstance?.fechaCreacion}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="torneo.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${com.torneo.fifa.Player.list()}" optionKey="id" optionValue="${{it.username}}" required="" value="" class="many-to-one" selected="true" disabled="disabled"/>
</div>

<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="torneo.password.label" default="Password" />
	</label>
	<input type="password" name="password" type="password" value="${torneoInstance?.password}"/>
</div>
<script>
var id_actual = $("#id_conectado").val();
$("#owner").val(id_actual);
$('#createTorneo').submit(function() {
	alert("kuak");
    $('#owner').removeAttr('disabled');
});
</script>
