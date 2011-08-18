<?php 

//make sure user is valid
if(check_ses_vars() != '') {


?>

<div id='header'>
	<div id='logout-button'>Logout</div>

	<ul class="tabs">
		<li><a id="applicants" class="menu-item" href="#tab1">Applicants</a></li>
		<li><a id="recommenders" class="menu-item" href="#tab2">Reconmmanders</a></li>
		<li><a id="programs" class="menu-item" href="#tab2">Programs</a></li>
	</ul>
</div>
<div id='body'>
	<div id="main"><div></div></div>	
</div>

<script>
$('.menu-item, #logout-button').button();
$('.menu-item').click( function() {
});


$('.menu-item').click(function () {
	var parent = $(this).parent();
	//var name = $(this).attr('id');
	
	parent.parent().find('.menu-item').each( function () {
		$(this).removeClass('ui-state-active-constant');
	});
	
	//select this one
//	parent.attr('selected', name);
	$(this).addClass('ui-state-active-constant');

	$.ajax({
		url: "pages/" + $(this).attr('id') + ".php",
		type:'POST',
		data:'',
		success: function(data){
			$('#main div').html(data);		
		}
	});
});

$('#applicants').addClass('ui-state-active-constant');

//load applicants automatically
$.ajax({
	url: "pages/applicants.php",
	type:'POST',
	data:'',
	success: function(data){
		if(data == 'login') {
			window.location = '<?php echo $home_page . '/login.php' ?>';
		} else {
			$('#main div').html(data);		
		}
	}
});


// Logout
$('#logout-button').click( function () {
	window.location = '<?php echo $home_page . '/scripts/logout.php'?>';
});
</script>


<?php

} //end user check

?>