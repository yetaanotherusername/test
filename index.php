<?php
error_reporting(0);
require_once('lib/mydb.php');
$config = parse_ini_file('lib/config.php');

$title = $incf = "";
if (!empty($_GET['action']) && $_GET['action'] == 'picture') {
	$title = "Picture";
	$incf = 'includes/picture.php';
} else {
	$title = "Gallery";
	$incf = 'includes/list.php';
}
?>
<!DOCTYPE html>
<html>
	<head>
		<title><?php echo $title; ?></title>
		<meta charset="UTF-8">
	</head>
	<body>
		<header>
			<h4>Awesome gallery!!</h4>
		</header>
		<hr />
		<article>
			<?php 
			$db = new mydb($config);
			if (!empty($db->error)) {
				echo $db->error;
			} else {
				$db->query("SET NAMES 'utf8'");
				$db->query("SET CHARACTER SET 'utf8'");
				
				if (is_file($incf)) {
					include $incf;
				} else {
					echo "system error!";
				}
				
				$db->close();
			}
			?>
		</article>
		<hr />
		<footer>
			<h5>&copy; <?php echo date("Y"); ?> - plamen</h5>
		</footer>
	</body>
</html>