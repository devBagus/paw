<?php
	//Membuat fungsi error yang berisi gobal variable untuk mengatur 
	function error(){
		global $error_surname;
		global $error_password;
	}
?>

<!-- Deklarasi dokumen html -->
<!DOCTYPE html>
<!-- Tag pembuka html -->
<html lang="en">
<head>
	<meta charset="utf-8">
	<!--Judul halaman yang akan ditampilkan pada browser -->
	<title>Login</title>
	<!-- Tag untuk membuat hubungan antara dokumen dan sumber daya eksternal (paling sering digunakan untuk link ke style sheet -->
	<link rel="stylesheet" type="text/css" href="../CSS/login.css">
</head>
<!--tempat dibuatnya semua konten website -->
<body>
	<!-- Tag pembuka php -->
	<?php
		$errors = array();
		// Melakukan pengecekan user 
		if (isset($_POST['login'])){
			//Memanggil file validasi untuk melakukan validasi siapa user yang masuk dan validasi kesalahan input
			include 'Validate/cekUser.php';
			include 'Validate/validate.inc';
			//Kondisi untuk mengecek user bila log = 1 maka user tersebut adalah teacher dan selain itu student(karena hanya da 2 user)
			if ($_GET['log'] == 1) {
				//Bila log = 1 true maka akan melakukan pengecekan NIP dan passsword pada database
				$nip = cekNIP($_POST['surname']);
				$cek = checkTeacher($_POST['surname'], $_POST['password']);
				if ($nip == True) {
					if($cek == True){
						//sesion dimulai
						// session_start();
						// $_SESSION['isStudent'] = true;
						$data = $_POST['surname'];
						//Bila NIP dan password benar maka akan masuk pada halaman homeSTeacher.php
						header("Location: Teacher/homeTeacher.php?user=$data");
						exit();
					}
					else {
						//menampilkan kesalahan inputan
						validatePassword($errors, $_POST, 'password', $cek);
						error();
					}
				}
				else{
					//menampilkan kesalahan inputan
					validateSurname($errors, $_POST, 'surname', $nip);
					validatePassword($errors, $_POST, 'password', $cek);
					error();
				}
			} else {
				//bila log = 0 , berarti user adalah seorang student
				//melakukan pengecekan NIM dan password pada database
				$nim = cekNIM($_POST['surname']);
				$cek = checkStudent($_POST['surname'], $_POST['password']);
				if ($nim == True) {
					if($cek == True){
						//session dimulai
						// session_start();
						// $_SESSION['isStudent'] = true;
						$data = $_POST['surname'];
						//Bila sudah berhasil login dengan NIM dan password yang benar maka akan masuk pada halaman HomeStudent.php
						header("Location: Student/HomeStudent.php?user=$data");
						exit();
					}
					else {
						//menampilkan pesan kesalahan
						validatePassword($errors, $_POST, 'password', $cek);
						error();
					}
				}
				else{
					//menampilkan pesan kesalahan
					validateSurname($errors, $_POST, 'surname', $nim);
					validatePassword($errors, $_POST, 'password', $cek);
					error();
				}
			}
			//menampilkan pesan error di atas form
			if ($errors){
				error();
				echo "<div class='warning'>";
					echo "<ul>";
					if (!empty($error_surname) && !empty($error_password)) {
						echo "<li>$error_surname</li>";
						echo "<li>$error_password</li>";
					}
					else if (!empty($error_surname)) {
						echo "<li>$error_surname</li>";
					}
					else if (!empty($error_password)) {
						echo "<li>$error_password</li>";
					}
					echo "</ul>";
				echo "</div>";
			}
		}
	?>
	<!-- mengatur tampilan user student dan teacher dengan CSS -->
	<div <?php if ($errors) {echo('class="geser"');} else {echo ('class="notgeser"');}?> >
		<div <?php if($_GET['log'] == 1) {echo 'class="kotak1"';} else{echo 'class="kotak"';}?> >
			<img <?php if($_GET['log'] == 1) {echo 'src="../Gambar/Teacher/Teacher.png"';} else{echo 'src="../Gambar/Student/Student.jpg"';}?> alt="" class="user">
			<form class="isi" action="login.php?log=<?php echo $_GET['log'] ?>" method="POST">
				<h1>Login Here</h1>
				<img src="../Gambar/Hope.jpg" alt="" class="gbr">
				<input type="text" name="surname" placeholder="<?php if($_GET['log'] == 1) {echo 'NIP';} else{echo 'NIM';}?>" value="<?php if(isset($_POST['login']))echo  htmlspecialchars($_POST['surname'])?>">
				<input type="password" name="password" placeholder="Password">
				<input type="submit" name="login" value="Login">
			</form>
		</div>
	</div>
</body>
</html>