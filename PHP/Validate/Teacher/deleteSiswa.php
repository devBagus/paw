<?php
	/*untuk menghubungkan ke database atau koneksi database*/
	include '../../database.php';
	$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$datakelas = $_GET['kirim'];/*untuk mengambil data dipost dan disimpan di variabel datakelas*/

	$statement = $dbe -> prepare("DELETE FROM student_class WHERE id_class = :id_class and nim=:nim");
	$statement -> bindValue (':id_class', $_POST['id_class']);
	$statement -> bindValue (':nim', $_POST['nim']);
	$statement -> execute();

	header("location:../../Teacher/detailKelas.php?kirim=$datakelas");
?>