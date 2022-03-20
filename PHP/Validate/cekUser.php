<!-- validasi untuk pengecekan saat login -->
<?php
	function checkTeacher() {
		//membuat koneksi database
		include 'database.php';
		$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$statement = $dbe -> prepare("SELECT * FROM teacher WHERE nip = :username and password_teacher = SHA2(:password, 0)");

		$statement -> bindValue(':username',$_POST['surname']);
		$statement -> bindValue(':password',$_POST['password']);
		$statement -> execute();

		//jika rowCount>0 maka akan mengembalikan sebuah nilai true dan bila kurang maka false
		if ($statement -> rowCount()>0) {
			return True;
		}
		else {
			return False;
		}
	}
	function checkStudent() {
		//membuat koneksi database
		include 'database.php';
		$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$statement = $dbe -> prepare("SELECT * FROM student WHERE nim = :username and password_student = SHA2(:password, 0)");

		$statement -> bindValue(':username',$_POST['surname']);
		$statement -> bindValue(':password',$_POST['password']);
		$statement -> execute();

		//jika rowCount>0 maka akan mengembalikan sebuah nilai true dan bila kurang maka false
		if ($statement -> rowCount()>0) {
			return True;
		}
		else {
			return False;
		}
	}
	function cekNIM() {
		//membuat koneksi database
		include 'database.php';
		$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$statement = $dbe -> prepare("SELECT nim FROM student WHERE nim = :username");

		$statement -> bindValue(':username',$_POST['surname']);
		$statement -> execute();
		
		//jika rowCount>0 maka akan mengembalikan sebuah nilai true dan bila kurang maka false
		if ($statement -> rowCount()>0) {
			return True;
		}
		else {
			return False;
		}
	}
	function cekNIP() {
		//membuat koneksi database
		include 'database.php';
		$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$statement = $dbe -> prepare("SELECT nip FROM teacher WHERE nip = :username");

		$statement -> bindValue(':username',$_POST['surname']);
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