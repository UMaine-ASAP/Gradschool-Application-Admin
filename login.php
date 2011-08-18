<html>
<head>
	<link type="text/css" href="js/jqueryUI/css/custom-theme/jquery-ui-1.8.10.custom.css" rel="stylesheet">
	<script type="text/javascript" src="js/jqueryUI/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="js/jqueryUI/js/jquery-ui-1.8.10.custom.min.js"></script>
	<script src='js/core.js'>></script>
	<link rel='stylesheet' type='text/css' href='css/styles.css'>

	<title>Graduate Application Interface</title>
</head>
<body id='login'>

<table style='width: 100%; height: 100%; margin: 0 auto;'>
	<tr  valign="middle" align='center' >
		<td style='display: block; margin: 0 auto; width: 100%;'>
			<div id='nav' class='window' style='float: center;'>
				<div class='inner'>
					<label>username:</label>
					<input type='text' id='username' style='width: 120px;'>
					<label>password:</label>
					<input type='password' id='password'  style='width: 120px;'>		
					<br>
					<input type='submit' id='loginbutton' value='login'>

					<br>
				</div>
			</div>

		</td>
	</tr>
</table>

<script>


$('#loginbutton').click( function (){
	login();
});

function login(){
$.ajax({
		url: "scripts/login.php",
		type:'POST',
		data:'username=' + $('#username').val() + '&password=' + $('#password').val(),
		success: function(data){
			if(data == 'success') {
				window.location.href = 'index.php';
			} else if(data == 'failure') {
				alert("Login Failed");
			} else {
				alert('Login incorrect');
			}
		}
	});
}
$('#password').keyup(function(e) {
	//alert(e.keyCode);
	if(e.keyCode == 13) {
		login();
	}
});

</script>
</body>
</html>