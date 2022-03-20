<?php
	include '../database.php';

	$data = $_GET['user'];
	$ele = $dbe -> query("SELECT * FROM student WHERE nim = $data");
	foreach ($ele as $isi) {
		$nim = $isi['nim'];
		$nama = $isi['nama_student'];
		$email = $isi['alamat_email'];
		$nohp = $isi['nomer_hp'];
		$pass = $isi['password_student'];
	}
	$kelas = $dbe -> query("SELECT c.nim, s.nama_student, t.nama_teacher, a.detail_class, a.nama_class, a.nip, a.id_class FROM student_class c, student s, teacher t, all_class a WHERE s.nim = (SELECT c.nim WHERE c.nim = $data) AND t.nip = (SELECT a.nip WHERE a.id_class = (SELECT c.id_class WHERE c.nim = $data) )");
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Welcome Student</title>
	<link rel="stylesheet" type="text/css" href="../../CSS/HomeStudent.css">
</head>
<body>
	<div class="menu">
		<ul>
			<li><a href="" class="aktif">Beranda</a></li>
			<li><a href="tambahKelas.php?user=<?php echo($data) ?>">Tambah Kelas</a></li>
			<li><a href="myProfile.php?user=<?php echo($data) ?>">Profile</a></li>
			<li><a href="../logout.php">Logout</a></li>
			<li class="user"><?php echo($nama); ?></li>
		</ul>
	</div>
	<div class="container">
		<div class="container-top">
			<img src="../../Gambar/top.png" alt="">
			<h1>UTM E-Learning</h1>
		</div>

		<div class="container-mid">
			<h2>Daftar Kelas</h2>
			<h4>Berikut list daftar kelas yang telah anda ikuti</h4>
			<table>
				<tr>
					<th>No</th>
					<th>Nama Kelas</th>
					<th>Dosen</th>
					<th>Detail Kelas</th>
				</tr>
				<?php
					$no = 1;
					foreach ($kelas as $key) {
					if ($no % 2 == 1) {
						echo ("<tr class='up'>");
					} else {
						echo ("<tr class='down'>");
					}
				?>
						<td class="no"><?php echo($no) ?></td>
						<td><?php echo($key['nama_class']) ?></td>
						<td><?php echo($key['nama_teacher']) ?></td>
						<td>
							<form action="tampilKelas.php?user=<?php echo($data); ?>" method="POST">
								<input type="hidden" name="nim" value="<?php echo($key['nim']) ?>">
								<input type="hidden" name="idClass" value="<?php echo($key['id_class']) ?>">
								<input type="submit" name="look" class="detail" value="Lihat">
							</form>
						</td>
					</tr>
				<?php
						$no++;
					}
				?>
			</table>
		</div>
	</div>

	<div class="footer">
	</div>
</body>
</html>