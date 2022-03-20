<?php
	/*untuk menghubungkan ke database atau koneksi database*/
	include '../database.php';

	$datakelas = $_GET['kirim'];/*untuk mengambil data dipost dan disimpan di variabel datakelas*/
	$kelas = $dbe -> query("SELECT * FROM all_class WHERE id_class = $datakelas");
	foreach ($kelas as $kel) {
		$nip = $kel['nip'];
		$id_class = $kel['id_class'];
		$nama_class = $kel['nama_class'];
		$detail_class = $kel['detail_class'];
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
			<li><a href="homeTeacher.php?user=<?php echo ($nip) ?>" class="aktif">Beranda</a></li>
			<li><a href="addClassTeacher.php?user=<?php echo ($nip) ?>">Tambah Kelas</a></li>
			<li><a href="../logout.php">Logout</a></li>
			<li class="user"><?php echo($nama_class); ?></li>
		</ul>
	</div>
	<div class="container">
		<div class="container-top">
			<img src="../../Gambar/top.png" alt="">
			<h1>UTM E-Learning</h1>
		</div>
		<div class="container-mid">
			<fieldset>
			<legend>Edit Detail Kelas</legend>
				<form name = "myFormTP3" action ="../Validate/Teacher/editClass.php?kirim=<?php echo $datakelas;?>&user=<?php echo $kel['nip'] ?>" method = "POST" enctype = "multipart/form-data">
					<table>
						<tr>
							<td class = "posisi"><label for = "nama_class"> Nama Kelas </label>&nbsp;</td>
							<td><input id= "nama_class" class = "lebar" type = "text" name = "nama_class" value="<?php if(isset($_POST['update'])){echo  htmlspecialchars($_POST['nama_class']);} else{echo($nama_class);} ?>"/></td>
							<td class = "lebar" ></td>
						</tr>
						<tr>
							<td class = "posisi"><label for = "detail_class"> Detail Kelas </label>&nbsp;</td>
							<td><input id="detail_class" class = "lebar" type = "text" name = "detail_class"  value="<?php if(isset($_POST['update'])){echo  htmlspecialchars($_POST['detail_class']);} else{echo($detail_class);} ?>" /></td>
							<td class = "lebar"></td>
						</tr>
						<tr>
							<td class = "posisi">&nbsp;&nbsp;</td>
							<td><input type = "submit" value = "Update" name = "update"/>&nbsp;&nbsp;<input type = "reset" value = "Reset" name = "reset"/>&nbsp;&nbsp;<input type = "submit" value = "Cancel" name = "cancel"/></td>
							<td></td>
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
