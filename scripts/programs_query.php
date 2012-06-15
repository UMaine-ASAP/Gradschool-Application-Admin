<?php 
//Tim Baker
//3/12/2011
//This script queries the user table based on POST filter values

include_once '../lib/variables.php';
include_once '../lib/database.php';
include_once '../lib/core.php';

//make sure user is valid
if(check_ses_vars() != '') {


$db = Database::get();

function insertQueryString(&$str, $field, $var = '') {
	if($var != '') {
		$str .= ' AND $field = $var';
	}
}


//build query
$qry = "SELECT academic_index, active, academic_program, academic_dept_code, academic_dept, academic_degree, nebhe_ct, nebhe_ma, nebhe_nh, nebhe_ri, nebhe_vt FROM um_academic";

$programs = $db->query($qry);




/* =========== */
// Sort Data
/* =========== */

sort_array($programs, $_POST['sort_by'], $_POST['sort_type']);

/* =========== */
// Process
/* =========== */

$color = 'light';
foreach($programs as $program) { 
	
	
	if( filter_set($program, 'direct', 	Array('active', 'academic_degree', 'nebhe_ct', 'nebhe_ma', 'nebhe_nh', 'nebhe_ri', 'nebhe_vt'))
		|| filter_set($program, 'contained', Array('academic_program', 'academic_dept_code', 'academic_dept'))
		) continue;
		
		
		//$program = strip_numeric_indexes($program);

	
	$color = $color == 'light'? 'dark' : 'light';
?>
	<tr class='<?php echo $color;?>' id='program-<?php echo $program['academic_index']?>'>
<!--  	<td><?php echo ''?></td>-->	
		<td class='center <?php if($program['active'] == 'yes') {echo 'cologreen';} else{echo 'colored';} ?>' >
			
			<?php echo $program['active']; ?>
		</td>
		<td><?php echo $program['academic_program']?></td>
		<td><?php echo $program['academic_dept_code']?></td>
		<td><?php echo $program['academic_dept']?></td>
		<td><?php echo $program['academic_degree']?></td>
		<td class='center' ><?php echo $program['nebhe_ct']?></td>
		<td class='center' ><?php echo $program['nebhe_ma']?></td>
		<td class='center' ><?php echo $program['nebhe_nh']?></td>
		<td class='center' ><?php echo $program['nebhe_ri']?></td>
		<td class='center' ><?php echo $program['nebhe_vt']?></td>		
		
		<!-- Delete option -->
 		<td class="ui-state-default ui-corner-all" id='program-<?php echo $program['academic_index']?>' title="edit program">
			<div class="edit-program-icon">
				<span class="ui-icon ui-icon-pencil"></span>
			</div>
		</td>
	</tr>

<?php } ?>
<script>
var program_id = -1;

$('.ui-state-default').hover( function() { $(this).addClass('ui-state-hover'); }, function() { $(this).removeClass('ui-state-hover'); });

$(document).ready( function() {

	$("#edit_program").dialog({
		resizeable: false,
		height: 300,
		width: 700,
		modal: true,
		autoOpen: false,
		buttons: {
			Delete: function(){
				var academic_index = $("input#academic_index").val();
				var dataString = 'academic_index=' + academic_index + '&mode=delete';

				$.ajax({
					url: "<?PHP echo $GLOBALS['APPMANAGER_ROOT'] ?>scripts/updateProgram.php",
					type: 'POST',
					data: dataString,
					success: function(data){
						$('#edit_program').dialog("close");
						$('#main div').load("<?PHP echo $GLOBALS['APPMANAGER_ROOT'] ?>pages/programs.php")

					}
				})
			},
			Cancel: function(){
				$(this).dialog("close");
			},
			Save: function() {
				var academic_index = $("input#academic_index").val();
				var academic_dept = $("select#academic_dept").val();
				var academic_degree = $("select#aca_deg").val();
				var academic_program = $("input#academic_programs").val();


				var active = $("input#active_check").is(':checked');
				var nebhe_ct = $("input#nebhe_ct").is(':checked');
				var nebhe_ma = $("input#nebhe_ma").is(':checked');
				var nebhe_nh = $("input#nebhe_nh").is(':checked');
				var nebhe_ri = $("input#nebhe_ri").is(':checked');
				var nebhe_vt = $("input#nebhe_vt").is(':checked');

				var datastring = 'mode=edit&academic_index=' + academic_index + '&academic_program=' + academic_program + '&academic_dept=' + academic_dept + '&academic_degree=' + academic_degree + '&nebhe_ct=' + nebhe_ct + '&nebhe_ma=' + nebhe_ma + '&nebhe_nh=' + nebhe_nh + '&nebhe_ri=' + nebhe_ri + '&nebhe_vt=' + nebhe_vt + '&active=' + active;

				$.ajax({
					url: "<?PHP echo $GLOBALS['APPMANAGER_ROOT'] ?>scripts/updateProgram.php",
					type: 'POST',
					data: datastring,
					success: function(data){
						
						$('#edit_program').dialog("close");
						$('#main div').load("<?PHP echo $GLOBALS['APPMANAGER_ROOT'] ?>pages/programs.php")
					} 
				});
			}
		}
	});

	$('.edit-program-icon').click( function() {

		var id = $(this).parent().attr('id');
		program_id = parseFloat( id.substring(8));
		$.ajax({
			url: "<?PHP echo $GLOBALS['APPMANAGER_ROOT'] ?>scripts/editProgram.php",
			type: 'POST',
			data: "program=" + program_id,
			success: function(data){
				$('#edit_program').html(data);
				$('#edit_program').dialog("open");
			} 
		});

	//alert(program_id);
});
	
});
</script>
<?php

} else {//end check ses vars
	echo "login";
}
?>