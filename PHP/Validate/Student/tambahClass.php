<?php
	//membuat fungsi tambah untuk menambah class
	function tambah() {
		//membuat koneksi database
		include '../database.php';

		$statement = $dbe -> prepare("INSERT INTO student_class (id_class, nim) VALUES (:id, :nim)");
		$statement -> bindValue(':id', $_POST['idClass']);
		$statement -> bindValue(':nim',$_POST['nim']);
		$statement -> execute();
		
		//jika rowCount>0 maka akan mengembalikan sebuah nilai true dan bila kurang maka false
		if ($statement -> rowCount()>0) {
			return True;
		}
		else {
			return False;
		}
	}
?>