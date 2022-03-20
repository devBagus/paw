<?php
	//membuat fungsi update Table untuk mengupdate data student
	function updateTable() {
		//membuat koneksi database
		include '../database.php';
		$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$statement = $dbe -> prepare("UPDATE student SET nama_student = :nama, alamat_email = :email, nomer_hp = :nohp WHERE nim = :nim");

		$statement -> bindValue(':nim',$_POST['surname']);
		$statement -> bindValue(':nama',$_POST['nama']);
		$statement -> bindValue(':email',$_POST['email']);
		$statement -> bindValue(':nohp',$_POST['nohp']);
		$statement -> execute();
		
		//jika rowCount>0 maka akan mengembalikan sebuah nilai true dan bila kurang maka false
		if ($statement -> rowCount()>0) {
			return True;
		}
		else {
			return False;
		}
	}
	//membuat fungsi update updatePassword untuk mengupdate password student
	function updatePassword() {
		//membuat koneksi database
		include '../database.php';
		$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$statement = $dbe -> prepare("UPDATE student SET password_student = SHA2(:passwordBaru,0) WHERE nim = :nim");

		$statement -> bindValue(':nim',$_POST['surname']);
		$statement -> bindValue(':passwordBaru',$_POST['passwordBaru']);
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