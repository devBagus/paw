<?php
	function error(){
		global $error_idKelas;
		global $error_namaKelas;
		global $error_detailKelas;
	}

	/*untuk menghubungkan ke database atau koneksi database*/
	include '../database.php';
	
	$query = $dbe -> query ("SELECT MAX(id_class) as auto_nambah FROM all_class");
	$dataId = $query -> fetch ();
	$kode = $dataId['auto_nambah'];
	$nourut = substr($kode, 0, 3);
	$nourut++;

	$data = $_GET['user'];/*untuk mengambil data dipost dan disimpan di variabel data*/
	
	if (isset($_POST['tambah'])) {
		include '../Validate/Teacher/addClass.php';
		include '../Validate/validate.inc';
		$errors = array();
		if (isset($_POST['id_class']) || isset($_POST['nama_class']) || isset($_POST['detail_class'])){
			validateIdkelas($errors, $_POST, 'id_class');
			validateNamaKelas($errors, $_POST, 'nama_class');
			validateDetailKelas($errors, $_POST, 'detail_class');
			if ($errors) {
				error();
			} else {
				$tambahKelas = addKelas($_POST['id_class'], $_POST['nip'], $_POST['nama_class'], $_POST['detail_class']);
				if ($tambahKelas == True) {
					header("Location: homeTeacher.php?user=$data");
				} else {
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
	<div class="menu">
		<ul>
			<li><a href="homeTeacher.php?user=<?php echo ($data) ?>">Beranda</a></li>
			<li><a href="" class="aktif">Tambah Kelas</a></li>
			<li><a href="../logout.php">Logout</a></li>
		</ul>
	</div>
	<div class="container">
		<div class="container-top">
			<img src="../../Gambar/top.png" alt="">
			<h1>UTM E-Learning</h1>
		</div>
		<div class="container-mid">
			<fieldset>
			<legend>Tambah Kelas Baru</legend>
				<form name = "myFormTP3" action = "addClassTeacher.php?user=<?php echo $_GET['user']; ?>" method = "POST" enctype = "multipart/form-data">
					<table>
						<tr>
							<td class = "posisi"><label for = "namakelas"> Nama Kelas </label>&nbsp;</td>
							<td><input id="namakelas" class = "lebar" type = "text" name = "nama_class" value = "<?php if(isset($_POST['tambah'])) echo ($_POST['nama_class']);?>"/>
								<input type="hidden" name="id_class" value="<?php echo($nourut) ?>">
								<input type="hidden" name="nip" value="<?php echo($data) ?>">
							</td>
						</tr>
						<tr>
							<td></td>
							<td><?php if(isset($_POST['tambah'])){ echo($error_namaKelas); }?></td>
						</tr>
						<tr>
							<td class = "posisi"><label for = "detailkelas"> Detail Kelas </label>&nbsp;</td>
							<td><input id="detailkelas" class = "lebar" type = "text" name = "detail_class" value = "<?php if(isset($_POST['tambah'])) echo ($_POST['detail_class']);?>"/></td>
						</tr>
						<tr>
							<td></td>
							<td><?php if(isset($_POST['tambah'])){ echo($error_detailKelas); }?></td>
						</tr>
						<tr>
							<td class = "posisi">&nbsp;&nbsp;</td>
							<td>
								<input type = "submit" value = "Tambah" name = "tambah"/>&nbsp;&nbsp;
								<input type = "reset" value = "Reset" name = "reset"/>
							</td>
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
