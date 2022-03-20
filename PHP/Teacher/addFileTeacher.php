<?php 
	function error(){
		global $error_namaFile;
		global $error_detailFile;
	}

	/*untuk menghubungkan ke database atau koneksi database*/
	include '../database.php';
	
	$query = $dbe -> query ("SELECT MAX(id_materi) as auto_nambah FROM materi");

	$dataId = $query -> fetch ();
	$kode = $dataId['auto_nambah'];
	$nourut = substr($kode, 0, 3);
	$nourut++;

	$datakelas = $_GET['kirim'];/*untuk mengambil data dipost dan disimpan di variabel datakelas*/
	$kelas = $dbe -> query("SELECT * FROM all_class WHERE id_class = $datakelas");
	foreach ($kelas as $k ) {
		$nip = $k['nip'];
		$id_kelas = $k['id_class'];
		$nama_kelas = $k['nama_class'];
		$detail_kelas = $k['detail_class'];
	}

	if (isset($_POST['tambah'])) {
		include "../Validate/Teacher/addFiles.php";
		include "../Validate/validate.inc";
		$errors = array();
		if (isset($_FILES['nama_materi']) || isset($_POST['detail_materi']) ){
			validateNamaFile($errors, $_FILES, 'nama_materi', 'name');
			validateDetailFile($errors, $_POST, 'detail_materi');
			if ($errors) {
				error();
			} else {
				$tambahFile = addFile($_POST['id_materi'], $_POST['id_class'], $_FILES['nama_materi'], $_FILES['nama_materi']['name'], $_FILES['nama_materi']['tmp_name'], $_POST['detail_materi']);
				if ($tambahFile == True) {
					header("location: detailKelas.php?kirim=$datakelas");
				}
				else {
					error();
				}
			}
		}
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Tugas Aplikasi</title> <!--judul Tugas Aplikasi--> 
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!--?????i--> 
	<link rel="stylesheet" type="text/css" href="../../CSS/form.css"> <!--untuk memanggil css eksternal--> 
</head>
<body>
	<div class="menu"><!--untuk membuat menu -->
		<ul>
			<li><a href="homeTeacher.php?user=<?php echo ($nip) ?>">Beranda</a></li> <!-- unntuk membuat tombol pada menu-->
			<li><a href="addClassTeacher.php?user=<?php echo($nip) ?>">Tambah Kelas</a></li>
			<li><a href="../logout.php">Logout</a></li>
			<li class="user"><?php echo($nama_kelas); ?></li>
		</ul>
	</div>
	<div class="container"> <!-- membuat bagian content-->
		<div class="container-top">
			<img src="../../Gambar/top.png" alt=""> <!--mengunggah gambar didalam conten -->
			<h1>UTM E-Learning</h1>
		</div>
		<div class="container-mid">
			<fieldset>
			<legend>Tambah File Baru</legend>
				<form name = "myFormTP3" action = "addFileTeacher.php?kirim=<?php echo $_GET['kirim']; ?>" method = "POST" enctype = "multipart/form-data"><!--membuat form untuk pengisian penambahan kelas baru -->
					<table><!--untuk membuat tabel form-->
						<tr>
							<td class = "posisi"><label for = "nama_materi"> Nama File </label>&nbsp;</td>
							<td>
								<input type="hidden" name="id_materi" value="<?php echo($nourut) ?>">
								<input type="hidden" name="id_class" value="<?php echo ($id_kelas) ?>">
								<input id="nama_materi" class = "lebar" type = "file" name = "nama_materi"/>
							</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td class = "lebar"><?php if(isset($_POST['tambah'])){ echo($error_namaFile); }?></td>
							<td></td>
						</tr>
						<tr>
							<td class = "posisi"><label for = "detail_materi"> Detail File</label>&nbsp;</td>
							<td><input id="detail_materi" class = "lebar" type = "text" name = "detail_materi" value = "<?php if(isset($_POST['tambah'])) echo ($_POST['detail_materi']);?>"/></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td class = "lebar"><?php if(isset($_POST['tambah'])){ echo($error_detailFile); }?></td>
							<td></td>
						</tr>
						<tr>
							<td class = "posisi">&nbsp;&nbsp;</td>
							<td><input type = "submit" value = "Tambah" name = "tambah"/>&nbsp;&nbsp;<input type = "reset" value = "Reset" name = "reset"/></td>
							<td class = "lebar"></td>
						</tr>
					</table>
				</form>
			</fieldset>
		</div>
	</div>
	<div class="footer">
	</div>
</body>
</html>