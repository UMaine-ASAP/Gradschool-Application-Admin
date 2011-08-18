<HTML>
<HEAD>
<TITLE>calculateion result</TITLE>
</HEAD>
<BODY>
<?php
if (($_POST[val1]== "")|| ($_POST[val2] == "") || ($_POST[calc]=="")){
	header("Location: calculate_form.html");
	exit;
}
if (($_POST[calc]=="add" )){
	$result = $_POST[val1]+$_POST[val2];
}
if (($_POST[calc]=="substract" )){
	$result = $_POST[val1]-$_POST[val2];
}if (($_POST[calc]=="multiply" )){
	$result = $_POST[val1]*$_POST[val2];
}else{
	$result = $_POST[val1] / $_POST[val2];
}

echo "the result of the calc is: ";
echo $result;
?>
<BODY>
</HTML>