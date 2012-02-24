<?php
include_once 'variables.php';
include_once 'database.php';

/* =================================== */
// User management
/* =================================== */
function isAssoc($arr)
{
    return array_keys($arr) !== range(0, count($arr) - 1);
}

function set_ses_vars($ID) {
	$_SESSION['userid'] = $ID;
	$_SESSION['lastAccess'] = time();
}

function check_ses_vars() {
	session_start();
	
	if(isset($_SESSION['userid']) && isset($_SESSION['lastAccess'])) {
		$latestAccess = time();
		if($latestAccess - $_SESSION['lastAccess'] > $GLOBALS["session_timeout"]) {
			user_logout();
			return '';
		}
		$_SESSION['lastAccess'] = $latestAccess;
		return $_SESSION['userid'];
	}
	return '';
}

/**
* Login
**/
function user_login($id) {
	session_start();
	set_ses_vars($id);
}

function user_logout() {
	session_start();
	session_unset();
	unset($_SESSION['userid']);
	unset($_SESSION['lastAccess']);
}


function verifyUser() {
	if(check_ses_vars() == '') {
		header('Location:' . $GLOBALS['APPMANAGER_ROOT'] . '/login.php');
	}
}

function getUserName($id) {
	$db = Database::get();
	$applicants = $db->query("SELECT * FROM admin WHERE id = %i", $id);
	return $applicants[0]['username'];
}

/* =================================== */
// Data filters
/* =================================== */
function check_in_range($start_date, $end_date, $date_from_user)
{
  // Convert to timestamp
  $start_ts = strtotime($start_date);
  $end_ts = strtotime($end_date);
  $user_ts = strtotime($date_from_user);

  // Check that user date is between start & end
  return (($user_ts >= $start_ts) && ($user_ts <= $end_ts));
}

function filter_set(&$src, $type, $fields) {
	$result = false;
	foreach($fields as $field) {
		$result = $result || filter($src, $type, $field);
	}
	return $result;
}

function filter(&$src, $type, $field) {
	if($_POST[$field] == '-') return false;
	
	switch($type) {
	case 'direct':
		if($_POST[$field] == '' ) $_POST[$field] = 'blank';
	
		$isblank = false;

		//check if field is blank
		if($_POST[$field] == 'blank') {
			if(isset($src[$field]) && $src[$field] != '') {
				$isblank = true;
			} else {
				$_POST[$field] = '';		
			}
		}	
	
		return isset($_POST[$field]) && $_POST[$field] != '' && $src[$field] != $_POST[$field] || $isblank;
		break;
	case 'contained':
		return $_POST[$field] != '' && preg_match('/'.$_POST[$field].'/i', $src[$field]) === 0;
		break;

	}
}


function sort_array(&$array_to_sort, $sort_by, $sort_type, $value = 'text') {

	if( $sort_by != '' && $sort_type != '' ) {
		//construct specific comparison function
		$cmp = $sort_type == 'ASCD' ? '<' : '>';
		if($value == 'text') {
			$v1 = 'strtolower($a["' . $sort_by . '"])';
			$v2 = 'strtolower($b["' . $sort_by . '"])';
		} else if ($value = 'numeric') {
			$v1 = 'intval($a["' . $sort_by . '"])';
			$v2 = 'intval($b["' . $sort_by . '"])';
		}
		$func_str = "return strcmp( $v1, $v2 ) $cmp 0 ;";

		//sort using function
		$compare_func = create_function('$a,$b', $func_str);
		usort($array_to_sort, $compare_func);	
	}
}

function sort_array_by_date(&$array_to_sort, $date_field, $order) {
	if( $date_field == '' || $order == '' ) return;

	//construct specific comparison function
	$cmp = $order == 'ASCD' ? '<' : '>';
	$v1 = 'strtotime($a["' . $date_field . '"])';
	$v2 = 'strtotime($b["' . $date_field . '"])';
	$func_str = "return strcmp( $v1, $v2 ) $cmp 0 ;";

	//sort using function
	$compare_func = create_function('$a,$b', $func_str);
	usort($array_to_sort, $compare_func);
}

function buildQuery($type, $field, $db) {

	$value = $db->escape( $_POST[$field] );
	$field = $db->escape( $field );

	if($value == '-') return "";	
	switch($type) {
	case 'direct':
		//if($_POST[$field] == '' );// $_POST[$field] = 'blank';

		if(isset($value) && $value != '') {
			return " AND $field = '$value'";
		}
		break;
	case 'contained':
		if($value != '') {
			return " AND LOWER($field) LIKE LOWER('%$value%')";
		}
		break;

	}
}

function checkValue($v) { return isset($v) && $v != '';}

function createDataTableHTML($name, $fields, $query_script, $limit) {

/* Javascript Code */
?>


<script>

// ==== //
// Update and sorting code
// ==== //

var sort_by   = '';
var sort_type = '';

function build_data(data) {
	var result = '';
	for(var i=0; i<strlen(data); i+=2) {
		
	}
}

function update(limit) {
	var limit = limit || 20;
	var send_data = '';
	
	$('.filter').each( function () {
		var id 			= $(this).attr('id');
		var index 		= id.indexOf('-');
		var fieldname 	= id.substr(index+1);
		//after first pass add &
		if(send_data != '')
			send_data += '&';
			
		send_data += fieldname + "=" + $(this).val();
	});
	var page = $('.pagination .selected a').html() || 1;
			
	send_data += '&sort_by=' + sort_by + '&sort_type=' + sort_type + '&limit=' + limit;
	$.ajax({
		url: '<?php echo $query_script;?>',
		type:'POST',
		data: send_data + '&page=' + page,
		success: function(data){
			//update result number
			results = data.split('**&&%%&&**');
			$('#result-count').html(results[1]);
			$('#resulting_data').html(results[0]);
		}
	});
}

$('.sort').click( function () {

	var id 			= $(this).attr('id');
	var index 		= id.indexOf('-');
	var new_sort 	= id.substr(index+1); //set global sort field
	
	
	if(new_sort != sort_by) {
		$('.sort').each( function() {		
			var icon = $(this).children().children('.icon');
			icon.removeClass('ui-icon');
			icon.removeClass('ui-icon-triangle-1-s');
			icon.removeClass('ui-icon-triangle-1-n');
		});
		sort_by = new_sort;
		
		var icon = $(this).children().children('.icon');		
		icon.addClass('ui-icon');
		icon.addClass('ui-icon-triangle-1-s');	
		sort_type = 'DESC';
	} else {
		var icon = $(this).children().children('.icon');

		if(icon.hasClass('ui-icon-triangle-1-s')) {
			icon.removeClass('ui-icon-triangle-1-s');
			icon.addClass('ui-icon, ui-icon-triangle-1-n');	
			sort_type = 'ASC';
		} else {
			icon.removeClass('ui-icon-triangle-1-n');			
			icon.addClass('ui-icon-triangle-1-s');	
			sort_type = 'DESC';
		}	
	}
	
	
		
	update();
});

$('.filter').keyup( function () {
//	wait(40);
//	update();
});
update(); //initial data

</script>

<?php
/* ======================== */
// Table header
/* ======================== */
?>
<!--<h2 style='text-align: center; margin-top: 0px;'><?php //echo $name; ?></h2>-->
<table class='data'>
<thead>

<?php
/* ======================== */
// Table filters
/* ======================== */
?> <tr class='unstyle light'> <?php

foreach($fields as $field) { ?>
	<th class='filter-header'>
	<?php 
	if($field[2] == 'text') { 
	?>
		<input class='filter' type='text' onchange='update()' id='selected-<?php echo $field[1];?>'>
	<?php 
	} else if($field[2] == 'select') { 
	?>
		<select class='filter' id='selected-<?php echo $field[1];?>' onchange='update()'>
			<?php 
				if (isAssoc($field[3]) ) {

					foreach($field[3] as $data => $value) { ?>
						<option value='<?php echo $data;?>'>
							<?php echo $value;?>
						</option>
					<?php 
					}
				
				} else {
					foreach($field[3] as $data) { ?>
						<option value='<?php echo $data;?>'>
							<?php echo $data;?>
						</option>
					<?php 
					}
				}
			?>			
		</select>
	<?php 
	} else if($field[2] == 'date') { ?>

			From:<input class='filter date-from' type='text' style='width: 80px;' id='selected-<?php echo $field[1];?>-from'>
			To:<input class='filter date-to' type='text' style='width: 80px;' id='selected-<?php echo $field[1];?>-to'>
			<script>
			$(function() {
				$( "#selected-<?php echo $field[1];?>-from, #selected-<?php echo $field[1];?>-to" ).datepicker({
					onSelect: function(dateText, inst) { 
						update();
					},
					dateFormat: "yy-mm-dd"
				});
			});

			</script>
	<?php } ?>
	</th>
<?php
}


/* ======================== */
// Table Field names
/* ======================== */
?>
<tr class='light' id='headings'>
<?php

foreach($fields as $field) { ?>
	<th style='white-space: nowrap;'>
		<a class='sort' id='sort-<?php echo $field[1]?>'>
			<?php echo $field[0]; ?>
			<span class='ui-state-default'><span class='icon' style='float: right;'></span></span>
		</a>
	</th>
<?php }

?></tr><?php

/* =========================== */
// End Header of table
/* =========================== */
?>
</thead>
	<tbody id='resulting_data'></tbody>
</table>
<?php
/* Result Count */
?>

<div><span id='result-count'></span></div>

<div><a href='#' onclick='update(1000000);'>Show All Results</a></div>

<form action="getCSV.php" method="post" > 
	<input type="hidden" name="csv_text" id="csv_text">
	<input type="submit" value="Get CSV File" onclick="getCSVData()">
</form>

<script>
function getCSVData(){
	var csv_value = "";

	//Build header
	$('.data').find('tr#headings').each( function() {
		var items = new Array();
		$(this).find('th').each( function() {
			var value = $(this).text();
			items.push( '"' + $.trim(value) + '"' );
		});	
		if( items.length > 0) {
			csv_value += items.join(',') + "\n";		
		}
	});
	//Build data
	$('.data').find('tr').each( function() {
		var items = new Array();
		$(this).find('td').each( function() {
			var value = $(this).text();
			items.push( '"' + $.trim(value) + '"' );
		});
		if( items.length > 0) {
			csv_value += items.join(',') + "\n";		
		}
	});
 	
 	$("#csv_text").val(csv_value);	
}
</script>

<?php } //end of function createDataTableHTML




function strip_numeric_indexes(&$a) {
	$result = array();
	foreach($a as $id_key => $value){
		if(!is_numeric($id_key)) $result[strtoupper($id_key)] = $value;
	}
	return $result;
}


function getDistinct($field, $table) {
	$db = new Database();
	$db->connect();
	$field = $db->escape($field);
	$table = $db->escape($table);

	$qry_string = "SELECT DISTINCT `" . $field . "` FROM `" . $table . "`";
	$qry = $db->query($qry_string);
	$result = array('-', '');
	foreach($qry as $q) {
		array_push($result, $q[$field]);
	}
	$db->close();
	return $result;
}


////////////////////////////////
  function get_mime_content_type($filename) {

        $mime_types = array(

            'txt' => 'text/plain',
            'htm' => 'text/html',
            'html' => 'text/html',
            'php' => 'text/html',
            'css' => 'text/css',
            'js' => 'application/javascript',
            'json' => 'application/json',
            'xml' => 'application/xml',
            'swf' => 'application/x-shockwave-flash',
            'flv' => 'video/x-flv',

            // images
            'png' => 'image/png',
            'jpe' => 'image/jpeg',
            'jpeg' => 'image/jpeg',
            'jpg' => 'image/jpeg',
            'gif' => 'image/gif',
            'bmp' => 'image/bmp',
            'ico' => 'image/vnd.microsoft.icon',
            'tiff' => 'image/tiff',
            'tif' => 'image/tiff',
            'svg' => 'image/svg+xml',
            'svgz' => 'image/svg+xml',

            // archives
            'zip' => 'application/zip',
            'rar' => 'application/x-rar-compressed',
            'exe' => 'application/x-msdownload',
            'msi' => 'application/x-msdownload',
            'cab' => 'application/vnd.ms-cab-compressed',

            // audio/video
            'mp3' => 'audio/mpeg',
            'qt' => 'video/quicktime',
            'mov' => 'video/quicktime',

            // adobe
            'pdf' => 'application/pdf',
            'psd' => 'image/vnd.adobe.photoshop',
            'ai' => 'application/postscript',
            'eps' => 'application/postscript',
            'ps' => 'application/postscript',

            // ms office
            'doc' => 'application/msword',
            'rtf' => 'application/rtf',
            'xls' => 'application/vnd.ms-excel',
            'ppt' => 'application/vnd.ms-powerpoint',

            // open office
            'odt' => 'application/vnd.oasis.opendocument.text',
            'ods' => 'application/vnd.oasis.opendocument.spreadsheet'
        );

        $ext = strtolower(array_pop(explode('.',$filename)));
        if (array_key_exists($ext, $mime_types)) {
            return $mime_types[$ext];
        }
        elseif (function_exists('finfo_open')) {
            $finfo = finfo_open(FILEINFO_MIME);
            $mimetype = finfo_file($finfo, $filename);
            finfo_close($finfo);
            return $mimetype;
        }
        else {
            return 'application/octet-stream';
        }
    }


 //Acts as a normal php include except output of script is returned from function instead of outputed to browser
function get_include_contents($filename) {
    if (is_file($filename)) {
        ob_start();
        include $filename;
        return ob_get_clean();
    }
    return false;
}
    
?>