<?php
	/*untuk menghubungkan ke database atau koneksi database*/
	include '../database.php';

	$datakelas = $_GET['kirim'];/*untuk mengambil data dipost dan disimpan di variabel datakelas*/
	$kelas = $dbe -> query("SELECT * FROM all_class WHERE id_class = $datakelas");
	foreach ($kelas as $k ) {
		$nip = $k['nip'];
		$id_kelas = $k['id_class'];
		$nama_kelas = $k['nama_class'];
		$detail_kelas = $k['detail_class'];
	}

	$file = $dbe -> query("SELECT id_materi, nama_materi, detail_materi FROM materi m WHERE m.id_class = $datakelas");
	$siswa =$dbe -> query("SELECT sc.id_class, sc.nim, s.nama_student 
							FROM student_class sc
							inner join student s
							on sc.nim = s.nim
							WHERE sc.id_class = $datakelas");
	$kelasSiswa = $dbe -> query("SELECT * FROM student_class WHERE id_class = $datakelas");

	foreach ($kelasSiswa as $isi ) {
		$id_class = $isi['id_class'];
		$nim = $isi ['nim'];
	}

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Tugas Aplikasi</title> <!--judul Tugas Aplikasi--> 
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!--?????i--> 
	<link rel="stylesheet" type="text/css" href="../../CSS/HomeTeacher.css"> <!--untuk memanggil css eksternal--> 
</head>
<body>
	<div class="menu">
		<ul>
			<li><a href="homeTeacher.php?user=<?php echo ($nip) ?>" class="aktif">Beranda</a></li>
			<li><a href="addClassTeacher.php?user=<?php echo($nip) ?>">Tambah Kelas</a></li>
			<li><a href="../logout.php">Logout</a></li>
			<li class="user"><?php echo($nama_kelas); ?></li>
		</ul>
	</div>
	<div class="container">
		<div class="container-top">
			<img src="../../Gambar/top.png" alt="">
			<h1>UTM E-Learning</h1>
		</div>
		<div class="container-mid">
			<h2>Detail Kelas <?php echo "($nama_kelas)";?></h2>
			<table>
				<tr>
					<th>Id Kelas</th>
					<th>Nama Kelas</th>
					<th>Detail Kelas</th>
					<th>Option</th>
				</tr>
				<tr>
					<td><?php echo ($id_kelas); ?></td>
					<td><?php echo ($nama_kelas); ?></td>
					<td><?php echo ($detail_kelas); ?></td>
					<td>
						<a href="editKelas.php?kirim=<?php echo $datakelas;?>&user=<?php echo $k['nip'] ?>">Edit Detail Kelas</a>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<form action="../Validate/Teacher/deleteDetailClass.php?kirim=<?php echo $datakelas; ?>" method="POST">
							<input type="hidden" name="id_class" value="<?php echo($k['id_class']) ?>">
							<input type="submit" name="delete" class="del" value="Delete Detail Kelas">
						</form>
						<form action="../Validate/Teacher/deleteClass.php?user=<?php echo $nip; ?>" method="POST">
							<input type="hidden" name="id_class" value="<?php echo($k['id_class']) ?>">
							<input type="hidden" name="nip" value="<?php echo($k['nip']) ?>">
							<input type="submit" name="delete" class="del" value="Delete Kelas">
						</form>
					</td>
				</tr>
			</table>
			<br>
			<br>
			<h2>Daftar Materi di Kelas <?php echo ($nama_kelas);?></h2>
			<table>
				<tr>
					<th>No.</th>
					<th>Id</th>
					<th>Nama File</th>
					<th>Detail File</th>
				</tr>
				<?php
					$no = 1;
					foreach ($file as $f) {
				?>
				<tr>
					<td><?php echo($no) ?></td>
					<td><?php echo($f['id_materi']) ?></td>
					<td><?php echo($f['nama_materi']) ?></td>
					<td><?php echo($f['detail_materi']) ?></td>
				</tr>
				<?php
					$no++;
					}  
				?>
				<tr>
					<td colspan="4">
						<form action="addFileTeacher.php?kirim=<?php echo $datakelas; ?>" method="POST">
							<input type="hidden" name="id_class" value="<?php echo($k['id_class']) ?>">
							<input type="submit" name="tambahKelas" class="back" value="Tambah File Materi">
						</form>
					</td>
				</tr>
			</table>
			<br>
			<h2>Daftar Mahasiswa</h2>
			<table>
				<tr>
					<th>No.</th>
					<th>NIM</th>
					<th>Nama</th>
					<th>Option</th>
				</tr>
				<?php
					$no = 1;
					foreach ($siswa as $mhs) {
					$hapus;
				?>
				<tr>
					<td><?php echo($no) ?></td>
					<td><?php echo($mhs ['nim']) ?></td>
					<td><?php echo($mhs['nama_student']) ?></td>
					<td>
						<form action="../Validate/Teacher/deleteSiswa.php?kirim=<?php echo $datakelas; ?>" method="POST">
							<input type="hidden" name="nim" value="<?php echo($mhs ['nim']) ?>">
							<input type="hidden" name="id_class" value="<?php echo($mhs['id_class']) ?>">
							<input type="submit" name="delete" class="del" value="Delete">
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
