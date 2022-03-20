<?php
	//membuat fungsi checkTable untuk mengecek id_class dan nim dari table student_class
	function checkTable() {
		//membuat koneksi database
		include '../database.php';
		$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$statement = $dbe -> prepare("SELECT * FROM student_class WHERE id_class = :id and nim = :nim");

		$statement -> bindValue(':id',$_POST['idClass']);
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