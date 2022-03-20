<?php
	include '../../database.php';
	$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$datakelas = $_GET['kirim'];/*untuk mengambil data dipost dan disimpan di variabel datakelas*/
	if (isset($_POST['delete'])) {
		$statement = $dbe-> prepare("UPDATE all_class SET detail_class = :detail_class WHERE id_class = :id_class");
		$statement->bindValue(':id_class', $_POST['id_class']); 
		$statement->bindValue(':detail_class', NULL);
		$statement-> execute();
	}
	header("location:../../Teacher/detailKelas.php?kirim=$datakelas");
?>