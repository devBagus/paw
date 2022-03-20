<?php
	function addKelas(){
		include '../database.php';
		$statement = $dbe -> prepare("INSERT INTO all_class(id_class, nip, nama_class, detail_class) VALUES (:id_class, :nip, :nama_class, :detail_class)");
		$statement->bindValue(':id_class', $_POST['id_class']); 
		$statement->bindValue(':nip', $_POST['nip']);
		$statement->bindValue(':nama_class', $_POST['nama_class']);
		$statement->bindValue(':detail_class', $_POST['detail_class']);
		$statement-> execute();

		if ($statement -> rowCount()>0) {
			return True;
		}
		else {
			return False;
		}
	}
?>