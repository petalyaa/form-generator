<div class="container-fluid">
	<div class="row-fluid">
		<div class="span2">
			<fieldset>
				<legend>Element</legend>
				<input id="text-input" type="text" placeholder="text-input" disabled />
				<input type="checkbox" checked="checked" id="checkbox-item" disabled /> <label for="checkbox-item">Checkbox</label>
			</fieldset>
		</div>
		<div class="span9">
			<p>asd</p>
			<p>asd</p>
			<p>asd</p>
			<p>asd</p>
			<p>asd</p>
			<p>asd</p>
			<p>asd</p>
			<p>asd</p>
			<p>asd</p>
		</div>
	</div>
</div>
<script type="text/Javascript">
	var $textInput = $("#text-input");
	$textInput.dragable();
</script>