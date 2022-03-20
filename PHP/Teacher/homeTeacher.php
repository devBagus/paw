<?php
	/*untuk menghubungkan ke database atau koneksi database*/
	include '../database.php';

	$data = $_GET['user'];/*untuk mengambil data dipost dan disimpan di variabel data*/
	$teacher = $dbe -> query("SELECT * FROM teacher WHERE nip = $data");/*untuk mengabil data teacher dari database */
	foreach ($teacher as $isi) {
		$nip = $isi['nip'];
		$nama = $isi['nama_teacher'];
		$pass = $isi['password_teacher'];
	}
	$kelas = $dbe -> query("SELECT ac.id_class, ac.nama_class, ac.detail_class FROM all_class ac, teacher t WHERE ac.nip = t.nip and t.nip= $data");/* untuk mengambil data all_class dari database*/
	$file = $dbe -> query("SELECT id_materi, nama_materi, detail_materi FROM materi m, all_class c WHERE m.id_class = c.id_class and c.nip = $data");/*untuk mengambil data materi dan all_class dari data base */
	
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Tugas Aplikasi</title> <!--judul Tugas Aplikasi--> 
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!--?????i--> 
	<link rel="stylesheet" type="text/css" href="../../CSS/HomeTeacher.css"> <!--untuk memanggil css eksternal--> 
</head>
<body>
	<div class="menu"><!-- -->
		<ul>
			<li><a href="" class="aktif">Beranda</a></li>
			<li><a href="addClassTeacher.php?user=<?php echo ($data) ?>">Tambah Kelas</a></li>
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
			<table>
				<tr>
					<th>No.</th>
					<th>Nama Kelas</th>
					<th>Detail Kelas</th>
				</tr>
				<?php
					$no = 1;
					foreach ($kelas as $key) {
					$kirim;
				?>
				<tr>
					<td class="no"><?php echo($no) ?></td>
					<td><?php echo($key['nama_class']) ?></td>
					<td>
						<a href="detailKelas.php?kirim=<?php echo ($key['id_class']) ?>&user=<?php echo $data ?>">Lihat Detail Kelas</a>
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
