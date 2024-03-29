<?php
include 'lib/variables.php';
include 'lib/core.php';

//verify user is a system user - logout otherwise
verifyUser();

?>

<html>
<head>
	<link type="text/css" href="js/jqueryUI/css/custom-theme/jquery-ui-1.8.10.custom.css" rel="stylesheet" />	
	<script type="text/javascript" src="js/jqueryUI/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="js/jqueryUI/js/jquery-ui-1.8.10.custom.min.js"></script>
	<link rel='stylesheet' type='text/css' href='css/styles.css' />
	<script src='js/core.js'></script>
	<script src='js/table2CSV.js'></script>
	<script src='js/jquery.select-to-autocomplete.js'></script>
	<link href="css/pagination.css" rel="stylesheet" type="text/css" />
	<link href="css/pagination-grey.css" rel="stylesheet" type="text/css" />

	<title>Graduate Application Interface</title>
</head>
<body>
<div id='content'>
	<div id='nav' class='window'>
			<div class='center'>
				<?php echo ucfirst(getUserName($_SESSION['userid']));?>
				<span class='right'><a href='<?php echo $GLOBALS['APPMANAGER_ROOT'] . 'scripts/logout.php'?>'>Logout</a></span>
			</div>
			
		<div class='inner'>

			<div><div class='menu-item' id='applicants'>Applicants</div></div>
			<div><div class='menu-item' id='recommenders'>Recommenders</div></div>
			<div><div class='menu-item' id='programs'>Programs</div></div>			
		</div>
	</div>
	<div id='main' class='window'>
		<div class='inner'>
		</div>
	</div>
	<div id="edit_program" title="Edit Program"></div>
</div>
</body>
<script>

function loadPage(page, limit) {
	limit = limit || <?php echo $SEARCH_LIMIT;?>;
	$.ajax({
		url: "<?php echo $GLOBALS['APPMANAGER_ROOT'] ?>pages/" + page + ".php",
		type:'POST',
		data:"limit=" + limit,
		success: function(data){
			if(data == 'login') {
				window.location.href =  '<?php echo $GLOBALS['APPMANAGER_ROOT'] ?>login.php';		
			} else {
				$('#main div').html(data);
			}
		}
	});
}

/*== Menu Buttons ==*/
$('.menu-item').button();

$('.menu-item').click(function () {
	var parent = $(this).parent();
	//var name = $(this).attr('id');
	
	parent.parent().find('.menu-item').each( function () {
		$(this).removeClass('ui-state-active-constant');
	});
	
	//select this one
//	parent.attr('selected', name);
	$(this).addClass('ui-state-active-constant');
	
	loadPage($(this).attr('id'));
});


/*== Preload applicants ==*/
loadPage('applicants');
$('#applicants').addClass('ui-state-active-constant');

</script>
</html>