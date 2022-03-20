<?php
	function addFile() {
		include '../database.php';
		$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		
		$statement = $dbe -> prepare("INSERT INTO materi(id_materi, id_class, nama_materi, detail_materi) VALUES (:id_materi, :id_class, :nama_materi, :detail_materi)");
		$statement->bindValue(':id_materi', $_POST['id_materi']); 
		$statement->bindValue(':id_class',  $_POST['id_class']);
		$statement->bindValue(':detail_materi', $_POST['detail_materi']);
		
		$nama_file = $_FILES['nama_materi']['name'];
		$source = $_FILES['nama_materi']['tmp_name'];
		$folder = "Materi/";

		$statement -> bindValue(':nama_materi',$nama_file);
		$pindah = move_uploaded_file($source, $folder.$nama_file);


		if ($pindah) {
			$statement-> execute();
			return True;
		}
		else {
			return False;
		}
	}
?>