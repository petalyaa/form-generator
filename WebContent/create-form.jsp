<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
			<ul class="nav nav-tabs nav-tabs-google">
  				<li id="element-tab-link" class="active"><a href="#element" data-toggle="tab">Element</a></li>
  				<li id="setting-tab-link"><a href="#setting" data-toggle="tab">Setting</a></li>
  				<li id="form-tab-link"><a href="#form" data-toggle="tab">Form</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="element">
					<div class="element-group-label">Standard</div>
					<table>
						<tr>
							<td><button class="btn element-button" data-input-type="text"><i class="icon-font"></i> Text Input</button></td>
							<td><button class="btn element-button" data-input-type="checkbox"><i class="icon-check"></i> Checkbox</button></td>
						</tr>
						<tr>
							<td><button class="btn element-button" data-input-type="radio"><i class="icon-ok-sign"></i> Radio Button</button></td>
							<td><button class="btn element-button" data-input-type="textarea"><i class="icon-align-left"></i> Textarea</button></td>
						</tr>
						<tr>
							<td><button class="btn element-button" data-input-type="select"><i class="icon-chevron-down"></i> Dropdown</button></td>
							<td><button class="btn element-button" data-input-type="label"><i class="icon-text-width"></i> Text</button>
						</tr>
					</table>
				</div>
				<div class="tab-pane" id="setting">
					<div class="alert alert-warning">
						No element selected.
					</div>
				</div>
				<div class="tab-pane" id="form">
					asd3
				</div>
			</div>
		</div>
		<div class="span9">
			<div class="alert alert-warning">
				<h4>Untitled form</h4>
			</div>
			<form id="form-object" class="form-horizontal form-target">
				
			</form>
		</div>
	</div>
</div>
<script type="text/Javascript">
	var $elementButton = $(".element-button");
	var $formObject = $("#form-object");
	$elementButton.each(function() {
		var $this = $(this);
		$this.click(function() {
			var elementLabel = "Untitled";
			var elementId = "test";
			var $controlGroup = $("<div class='control-group input-group'></div>");
			var $controlLabel = $("<label class='control-label'></label>");
			var $controls = $("<div class='controls'></div>");
			var inputType = $this.attr("data-input-type");
			var $input = getInputObject(inputType);
			if($input != null) {
				$controlLabel.attr("for", elementId);
				$controlLabel.html(elementLabel);
				if(inputType != 'checkbox') {
					$input.attr("id", elementId);
					$input.attr("placeholder", elementLabel);
					$controls.append($input);
				} else {
					for(var i = 0; i < $input.length; i++) {
						$controls.append($input[i]);
					}
				}
				
				$controlGroup.append($controlLabel);
				$controlGroup.append($controls);
				$formObject.append($controlGroup);
				
				$controlGroup.click(function() {
					removeControlGroupStyles();
					$controlGroup.addClass("info");
					$("#setting-tab-link a").click();
				});
			}
		});
	});
	function removeControlGroupStyles() {
		$(".input-group").each(function() {
			$(this).removeClass("info");
		});
	}
	function getInputObject(inputType) {
		var $obj = null; 
		if(inputType == 'text') {
			$obj = $("<input type='text' disabled />");
		} else if (inputType == 'checkbox') {
			var $checkbox1 = $("<label class='checkbox'></label>");
			$checkbox1.append("<input type='checkbox' disabled>");
			$checkbox1.append("Untitled 1");
			var $checkbox2 = $("<label class='checkbox'></label>");
			$checkbox2.append("<input type='checkbox' disabled>");
			$checkbox2.append("Untitled 2");
			var $checkbox3 = $("<label class='checkbox'></label>");
			$checkbox3.append("<input type='checkbox' disabled>");
			$checkbox3.append("Untitled 3");
			$obj = [$checkbox1, $checkbox2, $checkbox3];
		} 
		return $obj;
	}	
</script>