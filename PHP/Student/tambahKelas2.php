<?php
	include '../database.php';
	$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$data = $_GET['user'];

	$ele = $dbe -> query("SELECT * FROM student WHERE nim = $data");
	foreach ($ele as $isi) {
		$nim = $isi['nim'];
		$nama = $isi['nama_student'];
		$email = $isi['alamat_email'];
		$nohp = $isi['nomer_hp'];
		$pass = $isi['password_student'];
	}

	$kelas = $dbe -> prepare("SELECT t.nama_teacher, a.detail_class, a.nama_class, a.nip, a.id_class FROM teacher t, all_class a WHERE t.nip = (SELECT a.nip WHERE a.id_class = :id_class)");
	$kelas -> bindValue(':id_class',$_POST['idClass']);
	$kelas -> execute();
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Welcome Student</title>
	<link rel="stylesheet" type="text/css" href="../../CSS/tambahKelas.css">
</head>
<body>
	<?php
		foreach ($kelas as $key) {
	?>
	<div class="container">
		<div class="container-top">
			<?php
			 	if (isset($_POST['tambah'])) {
				 	include '../Validate/Student/cekTable.php';
				 	$cek = checkTable($_POST['nim'], $_POST['idClass']);
			 		
				 	if ($cek == True) {
				 		echo "<div class='notice_fail'>";
				 		echo "<p>Astaughfirullah. Kelas yang di inputkan sudah ada, Silahkan pilih kelas lain</p>";
				 	} else {
				 		include '../Validate/Student/tambahClass.php';
				 		$input = tambah($_POST['idClass'], $_POST['nim']);

				 		if ($input == True) {
				 			echo "<div class='notice_success'>";
								echo "<p>Alhamdulillah. Kelas berhasil ditambahkan</p>";
				 		} else {
				 			echo "<div class='notice_fail'>";
					 			echo "Error.. Input data has been failed";
				 		}
				 	}
					echo "</div>";
			 	}
			?>
			<h1>Kelas <?php echo($key['nama_class'])?></h1>
		</div>

		<div class="container-mid">
			<table class="isi1">
				<tr class="up">
					<td>Id Kelas</td>
					<td><?php echo($key['id_class'])?></td>
				</tr>
				<tr class="down">
					<td>Nama Dosen</td>
					<td><?php echo($key['nama_teacher'])?></td>
				</tr>
				<tr class="up">
					<td>Detail Kelas</td>
					<td><?php echo($key['detail_class'])?></td>
				</tr>
				<tr>
					<td>
						<form action="tambahKelas.php?user=<?php echo($data); ?>" method="POST">
							<input type="submit" name="submit" class="back" value="Kembali">
						</form>
					</td>
					<td>
						<form action="tambahKelas2.php?user=<?php echo($data); ?>&ID=<?php echo($key['id_class']) ?>" method="POST">
							<input type="hidden" name="idClass" value="<?php echo($key['id_class']) ?>">
							<input type="hidden" name="nim" value="<?php echo($data) ?>">
							<input type="hidden" name="nip" value="<?php echo($key['nip']) ?>">
							<input type="submit" name="tambah" class="join" value="Tambah">
						</form>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<?php
		}
	?>
</body>
</html>