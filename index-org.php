<?php
include_once 'lib/variables.php';
include_once 'lib/core.php';



//make sure user is valid
if(check_ses_vars() == '') {
		header('Location:' . $home_page . '/login.php');
}

?>

<html>
<head>
	<link type="text/css" href="js/jqueryUI/css/custom-theme/jquery-ui-1.8.10.custom.css" rel="stylesheet">
	<script type="text/javascript" src="js/jqueryUI/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="js/jqueryUI/js/jquery-ui-1.8.10.custom.min.js"></script>
	<script src='js/core.js'></script>
	<link rel='stylesheet' type='text/css' href='css/styles.css'>

	<title>Graduate Application Interface</title>
</head>
<body>
	<?php include_once 'include/interface.php'; ?>
</body>
</html>