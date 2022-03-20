<!-- Deklarasi dokumen html -->
<!DOCTYPE html> 
<!-- Tag pembuka html -->
<html lang="en">
<head>
	<meta charset="utf-8">
	<!--Judul halaman yang akan ditampilkan pada browser -->
	<title>Welcome in My Blog</title>
	<!-- Tag untuk membuat hubungan antara dokumen dan sumber daya eksternal (paling sering digunakan untuk link ke style sheet -->
	<link rel="stylesheet" type="text/css" href="CSS/index.css">
</head>
<!--tempat dibuatnya semua konten website -->
<body>
	<!-- wadah untuk menempatkan beberapa elemen menjadi satu bagian untuk mempermudah pemberian CSS contohnya class = "kotak"-->
	<div class="kotak">
		<!--Membuat judul atau heading -->
		<h1 class="judul">Masuk Sebagai</h1>
		<div class="group">
			<!-- Tag untuk membuat hyperlink -->
			<a href="PHP/login.php?log=1">
				<!-- elemen untuk memberi gambar -->
				<img src="Gambar/Teacher/Teacher.png" alt="">
				<h2>Teacher</h2>
			</a>
		</div>
		<div class="group">
			<!-- Tag untuk membuat hyperlink -->
			<a href="PHP/login.php?log=0">
				<!-- elemen untuk memberi gambar -->
				<img src="Gambar/Student/Student.jpg" alt="">
				<h2>Student</h2>
			</a>
		</div>
	</div>
</body>
</html>