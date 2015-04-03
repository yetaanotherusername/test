<?php

class mydb {

	private $dblink;
	private $error;
	private $errno = 0;

	public function __construct($params) {
		if (!empty($params)) {
			if (empty($params['host'])) {
				$this->error = "Missing host identification\n";
				return 0;
			} elseif (empty($params['uname'])) {
				$this->error = "Missing username string!\n";
				return 0;
			} elseif (empty($params['pass'])) {
				$this->error = "Missing password string!\n";
				return 0;
			} elseif (empty($params['db'])) {
				$this->error = "Missing database identification!\n";
				return 0;
			} else {
				$this->dblink = new mysqli($params['host'],$params['uname'],$params['pass'],$params['db']);
				if ($this->dblink->connect_errno) {
					$this->error = $this->dblink->connect_error;
					$this->errno = $this->dblink->connect_errno;
					return 0;
				}
			}
		}
	}

	public function close() {
		return $this->dblink->close();
	}

	public function query($query='') {
		$this->dblink->query($query);
	}

	public function fetch($query = '') {
		if (empty($query)) {
			$this->error = "Missing query!\n";
			return 0;
		}
		
		$qu = $query;
		$totalresults = 0;
		$result['query'] = $query;
		if ($qu = preg_replace("/limit\s[\d\s\,]+/si", "", $qu)) {
			if (!$rz = $this->dblink->query($qu)) {
				$this->errno = $result['errno'] = $this->dblink->errno;
				$this->error = $result['error'] = $this->dblink->error;
				return 0;
			}
			$totalresults = $rz->num_rows;
			$rz->close();
		}
		$numrows=0;
		if (!$res = $this->dblink->query($query)) {
			$this->errno = $result['errno'] = $this->dblink->errno;
			$this->error = $result['error'] = $this->dblink->error;
			return 0;
		} else {
			while ($row = $res->fetch_assoc()) {
				$result['result'][] = $row;
				$numrows++;
			}
		}
		$result['numrows'] = $numrows;
		$result['totalresults'] = $totalresults;
		if ($numrows > $totalresults) {
			$result['totalresults'] = $numrows;
		}
		$res->close();
		return $result;
	}

	public function getError() {
	  return $this->error;
	}
	
	public function getErrno() {
	  return $this->errno;
	}

}
