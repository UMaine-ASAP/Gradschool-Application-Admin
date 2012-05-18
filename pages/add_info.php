<?php

include_once '../lib/variables.php';
include_once '../lib/database.php';
include_once '../lib/core.php';

//make sure user is valid
if(check_ses_vars() != '') {


$db = Database::get();

$academic_dept_code 	= 	getDistinct('academic_dept_code', 'um_academic');
$academic_dept_heading_and_code 	= 	$db->query('SELECT DISTINCT academic_dept_code, academic_dept_heading FROM um_academic');


?>
<style>
.label td {
padding-right: 10px;
text-align: center;
}
</style>
<h3 style='margin: 0;'>Add a New Program</h3>
<br>
<table>
<tr class='label'>
	<td>Academic Program</td>
	<td>Academic Department</td>
	<td>Academic Degree</td>
	<td>NEBHE CT</td>
	<td>NEBHE MA</td>
	<td>NEBHE NH</td>
	<td>NEBHE RI</td>
	<td>NEBHE VT</td>
	<td></td>
</tr>

<tr>
  <td><input class='prog_data' type='text' id='academic_program' size=15 />
  <td>
	<select class='prog_data' type='text' id='academic_dept_heading_and_code'>
		<?php foreach($academic_dept_heading_and_code as $a) { ?>
			<option value='<?php echo $a[0]. '*' . $a[1]?>'><?php echo $a[1]?></option>
		<?php } ?>
	</select>
  </td>
  <td>
	<select class='prog_data' id='academic_degree' name='academic_degree'>
		<option value=' ' selected='selected'>--please select--</option>
		<option value='PHD' >PHD</option>
		<option value='MS' >MS</option>
		<option value='MA'>MA</option>
		<option value='CAS' >CAS</option>
		<option value='MED'>MED</option>
		<option value='MST' >MST</option>
		<option value='MSW'>MSW</option>
		<option value='MWC' >MWC</option>
		<option value='CGS'>CGS</option>
		<option value='MPS' >MPS</option>
		<option value='EDD' >EDD</option>
		<option value='MFOR' >MFOR</option>
		<option value='ME' >ME</option>
		<option value='MBA' >MBA</option>
		<option value='MM' >MM</option>  
	</select> 
  </td>
	<td><INPUT class='data' TYPE=CHECKBOX id='add_nebhe_ct'></td>
	<td><INPUT class='data' TYPE=CHECKBOX id='add_nebhe_ma'></td>
	<td><INPUT class='data' TYPE=CHECKBOX id='add_nebhe_nh'></td>
	<td><INPUT class='data' TYPE=CHECKBOX id='add_nebhe_ri'></td>
	<td><INPUT class='data' TYPE=CHECKBOX id='add_nebhe_vt'></td>
	<td><input id='submit' type = 'submit' name = 'submit' value='submit'></td>
</tr>

</table>



<script>


$(document).ready( function() {

	$('#submit').click(function(){
		var send_data = '';
		$('.prog_data').each( function () {
			var id 			= $(this).attr('id');
			var index 		= id.indexOf('-');
			var fieldname 	= id.substr(index+1);
		
			//after first pass add &
			if(send_data != '')
				send_data += '&';
			
			send_data += fieldname + '=' + $(this).val();
		});

			var nebhe_ct = $("input#add_nebhe_ct").is(':checked');
			var nebhe_ma = $("input#add_nebhe_ma").is(':checked');
			var nebhe_nh = $("input#add_nebhe_nh").is(':checked');
			var nebhe_ri = $("input#add_nebhe_ri").is(':checked');
			var nebhe_vt = $("input#add_nebhe_vt").is(':checked');

		send_data += '&nebhe_ct=' + nebhe_ct + '&nebhe_ma=' + nebhe_ma + '&nebhe_nh=' + nebhe_nh + '&nebhe_ri=' + nebhe_ri + '&nebhe_vt=' + nebhe_vt;
		
		$.ajax({
			url: '<?php echo $GLOBALS['APPMANAGER_ROOT']?>scripts/add_info_submit.php',
			type: 'POST',
			data:  send_data,
			success: function(data){
				alert(data);
				$('#main div').load("<?PHP echo $GLOBALS['APPMANAGER_ROOT'] ?>pages/programs.php");
			}
		});
	});
}); 

</script>
<hr><br>
<?php 
} else {//end user check
	echo 'login';
}
?>