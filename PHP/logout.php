<?php
//mengakhiri sesion dan mengembalikannya pada halaman index
	session_destroy();
	unset($_SESSION['isTeacher']);
	unset($_SESSION['isStudent']);
	header("Location: ../index.php");
	exit();
?>
