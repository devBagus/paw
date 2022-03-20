<?php
	include '../../database.php';
	$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		
	$datakelas = $_GET['kirim'];/*untuk mengambil data dipost dan disimpan di variabel datakelas*/
	if (isset($_POST['update'])) {
		$statement = $dbe -> prepare("UPDATE all_class SET nama_class = :nama_class, detail_class =:detail_class WHERE id_class = :id_class");
		$statement->bindValue(':id_class', $datakelas);
		$statement->bindValue(':nama_class', $_POST['nama_class']);
		$statement->bindValue(':detail_class', $_POST['detail_class']);
		$statement-> execute();
	}
	header("location:../../Teacher/detailKelas.php?kirim=$datakelas");
?>