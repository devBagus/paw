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
	$kelas = $dbe -> query("SELECT c.nim FROM student_class c WHERE c.nim = $data");
	$jumlah = 0;
	foreach ($kelas as $key) {
		$jumlah++;
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
			<li class="user"><?php echo($nama); ?>	</li>
		</ul>
	</div>
	<div class="container">
		<div class="container-left">
			<ul>
				<li class="menuProfile">
					<p><img src="../../Gambar/Student/user.png" alt=""><a href="" class="aktif">My Profile</a></p>
				</li>
				<li class="menuProfile">
					<p><img src="../../Gambar/Student/edit_user.png" alt=""><a href="editProfile.php?user=<?php echo($data) ?>">Edit Profile</a></p>
				</li>
				<li class="menuProfile">
					<p><img src="../../Gambar/Student/key.png" alt=""><a href="editPass.php?user=<?php echo($data) ?>">Edit Password</a></p>
				</li>
			</ul>
		</div>
		<div class="container-right">
			<h1>Profile Student</h1>
			<div class="kotak">
				<table>
					<tr class="up">
						<td class="left">Nama</td>
						<td class="right"><?php echo($nama); ?></td>
					</tr>
					<tr class="down">
						<td class="left">NIM</td>
						<td class="right"><?php echo($nim); ?></td>
					</tr>
					<tr class="up">
						<td class="left">Email</td>
						<td class="right"><?php echo($email); ?></td>
					</tr>
					<tr class="down">
						<td class="left">No Hp</td>
						<td class="right"><?php echo($nohp); ?></td>
					</tr>
					<tr class="up">
						<td class="left">Total Kelas</td>
						<td class="right"><?php echo($jumlah); ?></td>
					</tr>
				</table>
			</div>
			<?php
				session_start();
				if (isset($_SESSION['editProfil'])) {
					echo("<div class='noticeProfile'>");
						echo("<h4>Profile Has Been Updated</h4>");
					echo("</div>");
				}
				elseif (isset($_SESSION['editPass'])) {
					echo("<div class='noticePassword'>");
						echo "<h4>Password Has Been Updated</h4>";
					echo("</div>");
				}
				unset($_SESSION['editPass']);
				unset($_SESSION['editProfil']);
			?>
		</div>
	</div>
</body>
</html>