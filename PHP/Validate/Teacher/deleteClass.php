<?php
	include '../../database.php';
	$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$data = $_GET['user'];/*untuk mengambil data dipost dan disimpan di variabel datakelas*/

	$statement2 = $dbe -> prepare("DELETE FROM student_class WHERE id_class = :id_class");
	$statement2 -> bindValue(':id_class', $_POST['id_class']);
	$statement2 -> execute();

	$statement3 = $dbe -> prepare("DELETE FROM materi WHERE id_class = :id_class");
	$statement3 -> bindValue(':id_class', $_POST['id_class']);
	$statement3 -> execute();
	
	$statement = $dbe -> prepare("DELETE FROM all_class WHERE id_class = :id_class AND nip = :nip");
	$statement-> bindValue(':id_class', $_POST['id_class']);
	$statement-> bindValue(':nip', $_POST['nip']);
	$statement-> execute();
	
	header("location:../../Teacher/homeTeacher.php?user=$data");
?>