<HTML>
<HEAD>
<TITLE>MYFIRST PHP SCRIPT</TITLE>
<LINK //=http://www.google.com>
</HEAD>
<BODY>
<span><PRE>





</PRE></span>
<div class='title'> Hello World! </div>
<div id='Content'<?php echo "'Content'";?>>
	<div>Article 1</div>
</div>
<div class='title'></div>
<div class='Content'></div>
<?php
//? what do the <p> and <br> mean?
//? upper-case are diff between lower-case?
//? is this diff between the token "?php" and "?" enclosed in <> ?

$intVar = "223231235";
$int2 = "222";
echo $intVar+$int2;
echo "<p>\n</p>";// this is a comment 1 following PHP.
echo "<br><p>aaa\n</p>";
/*this is a comment 2 following PHP.*/

function multi($num){
	$answer = $num*100;
	return $answer;
}

echo multi(2);
//echo phpinfo();
echo "<br>";
//echo "\tafdad";
define ("ABC","this is PHP 5!!");
echo "asdfasd".ABC;

echo "<br>this is ".__FILE__."hahah";
echo "<br>this is ".__LINE__."sgsfdgsfdgsdgfds";
echo "<br>this is ".PHP_VERSION;
echo "<br>this is ".PHP_OS;

$cal = multi(2);
echo "<br>".($cal+=200)."<br>";
echo "<br>".(multi(2)+200)."<br>";

$string = "<br>hello";
echo $string;
$string.=" world<br>";
echo $string;

echo "<p>this's the $string</p>";

echo "1. show that \intVar.";
echo "<br>2. show that $intVar.";


?>
<FORM METHOD = "post" ACTION = "calculate.php">
<p>Value 1: <INPUT TYPE = "text" NAME="val1" SIZE=10></p>
<p>Value 2: <INPUT TYPE = "text" NAME="val2" SIZE=10></p>
</FORM>
</BODY>
</HTML>
<!--this is a comment 3 following HTML. -->