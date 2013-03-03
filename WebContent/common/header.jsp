<div class="navbar navbar-googlenav navbar-fixed-top">
	<div class="navbar-inner">
		<a class="brand" href="#">Form Generator</a>
		<ul class="nav" id="main-top-menu">
			<li id="create-form-li"><a href="#create-form">Create Form</a></li>
			<li id="view-form-li"><a href="#view-form">View Form</a></li>
		</ul>
	</div>
</div>
<script type="text/JavaScript">
	var $createFormLi = $("#create-form-li");
	var $viewFormLi = $("#view-form-li");

	bindClickableMenu($createFormLi);
	bindClickableMenu($viewFormLi);
	
	$(".brand").click(function() {
		removeAllActiveMenu();
		loadDiv('main.jsp');
	});
	
	function bindClickableMenu($element) {
		$element.children("a").click(function() {
			removeAllActiveMenu();
			$element.addClass("active");
			var requestedPageStr = getRequestedPage($(this).attr("href"));
			loadDiv(requestedPageStr);
		});
		
		function getRequestedPage(href) {
			return href.substring(1, href.length) + ".jsp";
		}
		
	}
	
	function removeAllActiveMenu() {
		$("#main-top-menu").children("li").each(function() {
			$(this).removeClass("active");
		});
	}
	
	function loadDiv(page) {
		$('#page-content').load(page);
	}
	
</script>