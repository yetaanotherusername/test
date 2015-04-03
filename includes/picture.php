<?php 
if (empty($_GET['picture'])) {
	echo "Wrong parameters!";
} else {
	$pid = (int) $_GET['picture'];
	
	$query = "SELECT p.title as ptitle, p.link, au.name, al.title as atitle
		FROM pictures AS p, authors AS au, albums AS al
		WHERE p.id = '$pid' 
			AND p.author_id = au.id
			AND p.album_id = al.id";
	$result = $db->fetch($query);
	if ($result['totalresults'] == 0) {
		if (!empty($db->error)) {
			echo $db->error . "<br />";
		}
		echo "no such picture";
	} else {
		$res = $result['result'][0];
		$file = "pictures/" . $res['link'];
		if (!file_exists($file)) {
			echo "picture file removed or does not exist!";
		} else {
			$psize = filesize($file);
			$psize_mb = sprintf("%.3f",$psize/1024/1024);
			echo 'This is picture "' . $res['ptitle'] . '" from "' . $res['name'] . '", currently in album "' . $res['atitle'] . 
			'", having size of ' . $psize . ' bytes, which is ' . $psize_mb . ' MB' .
			'<br /><img src="'.$file.'">';
		}
	}
}
?>