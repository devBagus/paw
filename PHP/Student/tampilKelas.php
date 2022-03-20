<?php
	include '../database.php';
	$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$data = $_GET['user'];

	if (isset($_POST['delete'])) {
		include '../Validate/Student/deleteTable.php';
		$delete = delTable($_POST['idClass'], $_POST['nim']);
		if ($delete == True) {
			header("Location: HomeStudent.php?user=$data");
			exit();
		}
	}

	$ele = $dbe -> query("SELECT * FROM student WHERE nim = $data");
	foreach ($ele as $isi) {
		$nim = $isi['nim'];
		$nama = $isi['nama_student'];
		$email = $isi['alamat_email'];
		$nohp = $isi['nomer_hp'];
	}

	$kelas = $dbe -> prepare("SELECT t.nama_teacher, a.detail_class, a.nama_class, a.nip, a.id_class, s.nama_student FROM student_class c, student s, teacher t, all_class a WHERE c.id_class = (SELECT a.id_class WHERE a.id_class = :id_class) AND c.nim = (SELECT s.nim WHERE s.nim = :nim) AND t.nip = a.nip");
	$kelas -> bindValue(':id_class',$_POST['idClass']);
	$kelas -> bindValue(':nim',$_POST['nim']);
	$kelas -> execute();

	$materi = $dbe -> prepare("SELECT * FROM materi WHERE id_class = :id_class");
	$materi -> bindValue(':id_class', $_POST['idClass']);
	$materi -> execute();
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Welcome Student</title>
	<link rel="stylesheet" type="text/css" href="../../CSS/HomeStudent.css">
</head>
<body>
	<?php
		foreach ($kelas as $key) {
	?>
	<div class="container">
		<div class="container-top">
			<img src="../../Gambar/top.png" alt="">
			<h1>Kelas <?php echo($key['nama_class'])?></h1>
		</div>

		<div class="container-mid">
			<table>
				<tr class="up">
					<td>Nama</td>
					<td><?php echo($key['nama_student'])?></td>
				</tr>
				<tr class="down">
					<td>Id Kelas</td>
					<td><?php echo($key['id_class'])?></td>
				</tr>
				<tr class="up">
					<td>Nama Dosen</td>
					<td><?php echo($key['nama_teacher'])?></td>
				</tr>
				<tr class="down">
					<td>Detail Kelas</td>
					<td><?php echo($key['detail_class'])?></td>
				</tr>
				<tr>
					<td>
						<form action="HomeStudent.php?user=<?php echo($data); ?>" method="POST">
							<input type="submit" name="submit" class="back" value="Kembali">
						</form>
					</td>
					<td>
						<form action="tampilKelas.php?user=<?php echo($data); ?>" method="POST">
							<input type="hidden" name="idClass" value="<?php echo($key['id_class']) ?>">
							<input type="hidden" name="nim" value="<?php echo($data) ?>">
							<input type="hidden" name="nip" value="<?php echo($key['nip']) ?>">
							<input type="submit" name="delete" class="del" value="Delete">
						</form>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<?php
		}
	?>
	<div class="footer">
	</div>
</body>
</html>