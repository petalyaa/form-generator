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
					<div class="alert alert-warning" id="no-input-selected-alert">
						No element selected.
					</div>
					<div id="setting-input-text" class="hide">
						<form class="form-horizontal">
							<label for="setting-input-text-name">Field Name</label>
							<input type="text" placeholder="Field Name" value="" name="fieldName" id="setting-input-text-name" />
							<br><br>
							<label for="setting-input-text-label">Field Label</label>
							<input type="text" placeholder="Field Label" value="" name="fieldLabel" id="setting-input-text-label" />
							<br><br>
							<label for="setting-input-text-label">Field ID</label>
							<input type="text" placeholder="Field ID" value="" name="fieldId" id="setting-input-text-id" />
						</form>
					</div>
					<div id="setting-input-checkbox" class="hide">
						<form class="form-horizontal">
							<label for="setting-input-text-name">Field Name</label>
							<input type="text" placeholder="Field Name" value="" name="fieldName" id="setting-input-text-name" />
							<br><br>
							<label for="setting-input-text-label">Field Label</label>
							<input type="text" placeholder="Field Label" value="" name="fieldLabel" id="setting-input-text-label" />
							<table class="table" id="setting-checkbox-items">
								<thead>
									<tr>
										<th>ID</th>
										<th>Value</th>
										<th>Label</th>
										<th>&nbsp;</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</form>
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
	var $selectedRow = null;
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
				$controlGroup.attr("data-input-type", inputType);
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
					$selectedRow = $(this);
					removeControlGroupStyles();
					$("#no-input-selected-alert").hide();
					$controlGroup.addClass("info");
					$("#setting-tab-link a").click();
					var type = $(this).attr("data-input-type");
					$("#setting-input-text").hide();
					if(type == 'text') {
						$("#setting-input-text").show();
						var originalText = $controlGroup.children("label").html();
						$("#setting-input-text-label").val(originalText);
						$("#setting-input-text-label").unbind("keyup");
						$("#setting-input-text-label").keyup(function() {
							var newVal = $("#setting-input-text-label").val();
							$controlGroup.children("label").html(newVal);
							$controlGroup.children("div").children("input").attr("placeholder", newVal);
						});
					} else if (type == 'checkbox') {
						$("#setting-input-checkbox").show();
						$itemsTable = $("#setting-checkbox-items");
						
					}
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