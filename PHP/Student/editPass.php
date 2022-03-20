<?php
	function error(){
		global $error_password;
		global $error_passwordBaru;
		global $error_confirm;
	}

	function checkStudent() {
		//membuat koneksi database
		include '../database.php';
		$dbe -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$statement = $dbe -> prepare("SELECT * FROM student WHERE nim = :username and password_student = SHA2(:password, 0)");

		$statement -> bindValue(':username',$_POST['surname']);
		$statement -> bindValue(':password',$_POST['password']);
		$statement -> execute();

		//jika rowCount>0 maka akan mengembalikan sebuah nilai true dan bila kurang maka false
		if ($statement -> rowCount()>0) {
			return True;
		}
		else {
			return False;
		}
	}
	//membuat koneksi database
	include '../database.php';

	$data = $_GET['user'];
	$ele = $dbe -> query("SELECT * FROM student WHERE nim = $data");
	//mengecek data
	foreach ($ele as $isi) {
		$nim = $isi['nim'];
		$nama = $isi['nama_student'];
		$email = $isi['alamat_email'];
		$nohp = $isi['nomer_hp'];
		$pass = $isi['password_student'];
	}
	//memvalidasi data password saat mengupdate
	if (isset($_POST['ubahPassword'])) {
		include '../Validate/Student/updateTable.php';
		// include '../Validate/cekUser.php';
		include '../Validate/validate.inc';
		$errors = array();
		$cekPassword = checkStudent($_POST['surname'], $_POST['password']);

		//memvalidasi data password lama dan password baru serta validasi ketika tidak sesuai dengan inputan yang ditentukan di validasi
		if (isset($_POST['password']) || isset($_POST['passwordBaru']) ||isset($_POST['confirm'])){
			validatePassword($errors, $_POST, 'password', $cekPassword);
			validatePasswordBaru($errors, $_POST, 'passwordBaru');
			validateConfirm($errors, $_POST, 'confirm');
			if ($errors) {
				error();
			} else {
				if ($cekPassword == True) {
					$update = updatePassword($_POST['surname'],$_POST['passwordBaru']);
					if ($update == True) {
						session_start();
						header("Location: myProfile.php?user=$data");
						$_SESSION['editPass'] = True;
						exit();
					}
				} else {
					validatePassword($errors, $_POST, 'password', $cekPassword);
					errors();
				}
			}
		}
	}
?>
<!-- Deklarasi dokumen html -->
<!DOCTYPE html>
<!-- Tag pembuka html -->
<html lang="en">
<head>
	<meta charset="utf-8">
	<!--Judul halaman yang akan ditampilkan pada browser -->
	<title>Profil</title>
	<!-- Tag untuk membuat hubungan antara dokumen dan sumber daya eksternal (paling sering digunakan untuk link ke style sheet -->
	<link rel="stylesheet" type="text/css" href="../../CSS/editProfil.css">
</head>
<!--tempat dibuatnya semua konten website -->
<body>
	<!-- membuat tampilan menu bar -->
	<div class="menu">
		<ul>
			<li><a href="HomeStudent.php?user=<?php echo($data) ?>">Beranda</a></li>
			<li><a href="tambahKelas.php?user=<?php echo($data) ?>">Tambah Kelas</a></li>
			<li><a href="" class="aktif">Profile</a></li>
			<li><a href="../logout.php">Logout</a></li>
			<li class="user"><?php echo($nama); ?>	</li>
		</ul>
	</div>
	<!-- membuat tampilan menu edit password di sisi kiri-->
	<div class="container">
		<div class="container-left">
			<ul>
				<li class="menuProfile">
					<p><img src="../../Gambar/Student/user.png" alt=""><a href="myProfile.php?user=<?php echo($data) ?>">My Profile</a></p>
				</li>
				<li class="menuProfile">
					<p><img src="../../Gambar/Student/edit_user.png" alt=""><a href="editProfile.php?user=<?php echo($data) ?>">Edit Profile</a></p>
				</li>
				<li class="menuProfile">
					<p><img src="../../Gambar/Student/key.png" alt=""><a href="" class="aktif">Edit Password</a></p>
				</li>
			</ul>
		</div>
		<!-- membuat form imputan saat edit password -->
		<div class="container-right">
		<!--Membuat judul atau heading -->
			<h1>Edit Password</h1>
			<div class="form">
				<!-- membuat form untuk meninputkan data -->
				<form action="editPass.php?user=<?php echo($data) ?>" method="POST">
					<table>
						<tr>
							<td>Password Lama</td>
							<td></td>
						</tr>
						<tr>
							<td>
								<input type="hidden" name="surname" value="<?php echo($data) ?>">
								<input type="password" name="password" value="<?php if(isset($_POST['ubahPassword']))echo  htmlspecialchars($_POST['password'])?>">
							</td>
							<td></td>
						</tr>
						<tr>
							<td class="error"><?php if(isset($_POST['ubahPassword'])){ echo("$error_password"); }?></td>
							<td></td>
						</tr>
						<tr>
							<td>Password Baru</td>
							<td>Konfirmasi Password Baru</td>
						</tr>
						<tr>
							<td><input type="password" name="passwordBaru" value="<?php if(isset($_POST['ubahPassword']))echo  htmlspecialchars($_POST['passwordBaru'])?>"></td>
							<td><input type="password" name="confirm"></td>
						</tr>
						<tr>
							<td class="error"><?php if(isset($_POST['ubahPassword'])){ echo($error_passwordBaru); }?></td>
							<td class="error"><?php if(isset($_POST['ubahPassword'])){ echo($error_confirm); }?></td>
						</tr>
						<tr>
							<td><input type="submit" name="ubahPassword" value="Edit Password" class="tombol"></td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>