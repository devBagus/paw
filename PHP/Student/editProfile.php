<?php
	function error(){
		global $error_nama;
		global $error_email;
		global $error_nohp;
		global $error_password;
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
	//memvalidasi data student saat mengupdate
	if (isset($_POST['edit'])) {
		include '../Validate/Student/updateTable.php';
		// include '../Validate/cekUser.php';
		include '../Validate/validate.inc';
		$errors = array();
		$cekPassword = checkStudent($_POST['surname'], $_POST['password']);
		if (isset($_POST['nama']) || isset($_POST['email']) ||isset($_POST['nohp'])){
			validateNama($errors, $_POST, 'nama');
			validateEmail($errors, $_POST, 'email');
			validateNohp($errors, $_POST, 'nohp');
			validatePassword($errors, $_POST, 'password', $cekPassword);
			if ($errors) {
				error();
			} else {
				if ($cekPassword == True) {
					$update = updateTable($_POST['surname'],$_POST['nama'], $_POST['email'], $_POST['nohp']);
					if ($update == True) {
						session_start();
						$_SESSION['editProfil'] = True;
						header("Location: myProfile.php?user=$data");
						exit();
					}
				} else {
					validatePassword($errors, $_POST, 'password', $cekPassword);
					error();
				}
			}
		}
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Profil</title>
	<link rel="stylesheet" type="text/css" href="../../CSS/editProfil.css">
</head>
<body>
	<div class="menu">
		<ul>
			<li><a href="HomeStudent.php?user=<?php echo($data) ?>">Beranda</a></li>
			<li><a href="tambahKelas.php?user=<?php echo($data) ?>">Tambah Kelas</a></li>
			<li><a href="" class="aktif">Profile</a></li>
			<li><a href="../logout.php">Logout</a></li>
			<li class="user"><?php echo($nama); ?></li>
		</ul>
	</div>
	<div class="container">
		<div class="container-left">
			<ul>
				<li class="menuProfile">
					<p><img src="../../Gambar/Student/user.png" alt=""><a href="myProfile.php?user=<?php echo($data) ?>">My Profile</a></p>
				</li>
				<li class="menuProfile">
					<p><img src="../../Gambar/Student/edit_user.png" alt=""><a href="" class="aktif">Edit Profile</a></p>
				</li>
				<li class="menuProfile">
					<p><img src="../../Gambar/Student/key.png" alt=""><a href="editPass.php?user=<?php echo($data) ?>">Edit Password</a></p>
				</li>
			</ul>
		</div>
		<div class="container-right">
			<h1>Edit Profile</h1>
			<div class="form">
				<form action="editProfile.php?user=<?php echo($data) ?>" method="POST">
					<table>
						<tr>
							<td>Nama</td>
							<td>NIM</td>
						</tr>
						<tr>
							<td><input type="text" name="nama" placeholder="<?php echo($nama); ?>" value="<?php if(isset($_POST['edit']))echo  htmlspecialchars($_POST['nama'])?>"></td>
							<td><input type="text" name="nim" value="<?php echo($nim) ?>" disabled></td>
						</tr>
						<tr>
							<td class="error"><?php if(isset($_POST['edit'])){ echo($error_nama); }?></td>
							<td></td>
						</tr>
						<tr>
							<td>Email</td>
							<td>No Hp</td>
						</tr>
						<tr>
							<td><input type="text" name="email" placeholder="<?php echo($email); ?>" value="<?php if(isset($_POST['edit']))echo  htmlspecialchars($_POST['email'])?>"></td>
							<td><input type="text" name="nohp" placeholder="<?php echo($nohp); ?>" value="<?php if(isset($_POST['edit']))echo  htmlspecialchars($_POST['nohp'])?>"></td>
						</tr>
						<tr>
							<td class="error"><?php if(isset($_POST['edit'])){ echo($error_email); }?></td>
							<td class="error"><?php if(isset($_POST['edit'])){ echo($error_nohp); }?></td>
						</tr>
						<tr>
							<td colspan="2" class="inputPassword">Untuk Konfirmasi, Masukkan Password anda</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="hidden" name="surname" value="<?php echo($data) ?>">
								<input type="password" name="password">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="error"><?php if(isset($_POST['edit'])){ echo("$error_password"); }?></td>
						</tr>
						<tr>
							<td><input type="submit" name="edit" value="Edit Profile" class="tombol"></td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>