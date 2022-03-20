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
	$kelas = $dbe -> query("SELECT t.nama_teacher, a.nama_class, a.detail_class, a.id_class, a.nip FROM all_class a, teacher t WHERE t.nip = a.nip");
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Welcome Student</title>
	<link rel="stylesheet" type="text/css" href="../../CSS/tambahKelas.css">
</head>
<body>
	<div class="menu">
		<ul>
			<li><a href="HomeStudent.php?user=<?php echo($data) ?>">Beranda</a></li>
			<li><a href="" class="aktif">Tambah Kelas</a></li>
			<li><a href="myProfile.php?user=<?php echo($data) ?>">Profile</a></li>
			<li><a href="../logout.php">Logout</a></li>
			<li class="user"><?php echo($nama) ?></li>
		</ul>
	</div>

	<div class="container">
		
		<div class="container-mid">
			<table class="isi">
				<tr>
					<th>No</th>
					<th>Nama Kelas</th>
					<th>Nambah Kelas</th>
				</tr>
				<?php
					$no = 1;
					foreach ($kelas as $key) {
				?>
					<tr>
						<td class="no"><?php echo($no) ?></td>
						<td><?php echo($key['nama_class']) ?></td>
						<td>
							<form action="tambahKelas2.php?user=<?php echo($data); ?>" method="POST">
								<input type="hidden" name="idClass" value="<?php echo($key['id_class']) ?>">
								<input type="hidden" name="nim" value="<?php echo($data) ?>">
								<input type="submit" name="look" class="lihat" value="Lihat">
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