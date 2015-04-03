<?php 
$limit = $config['row_count'];
if (isset($_GET['page']) && preg_match("/\d+/",$_GET['page'])) {
	$current_page = (int) $_GET['page'];
} else {
	$current_page = 1;
}

$previous_page = $current_page - 1;
$next_page = $current_page + 1;

$offset = ($current_page - 1) * $limit;

$query = "SELECT id, title, thumbnail FROM pictures ORDER BY id DESC LIMIT $offset,$limit";
$result = $db->fetch($query);
if ($result['numrows'] > 0) {
	$pages_count = ceil($result['totalresults']/$limit);
	$result = $result['result'];
	for ($i=0;$i<$limit;$i++) {
		if (isset($result[$i])) {
			echo '<a href="index.php?action=picture&picture=' . $result[$i]['id'] . '" title="' . $result[$i]['title'] . '" target="_blank"><img src="pictures/' . $result[$i]['thumbnail'] . '" alt="' . $result[$i]['title'] . '" /></a>&nbsp;';
		}
	}
	echo "<nav>";
	if ($pages_count > 1 && $current_page > 1) {
		echo '<a href="index.php?page=1">&laquo; first page</a>&nbsp;|&nbsp;<a href="index.php?page='.$previous_page.'">previous page</a>';
	}
	if ($current_page < $pages_count) {
		echo '&nbsp;<a href="index.php?page='.$next_page.'">next page</a>&nbsp;|&nbsp;<a href="index.php?page='.$pages_count.'">last page &raquo;</a>';
	}
	echo "</nav>";
} else {
	if (!empty($db->error)) {
		echo $db->error . "<br />";
	}
	echo "no results found!";
}
?>