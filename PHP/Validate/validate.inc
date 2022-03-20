<?php
	$error_surname;
	$error_NIM;
	$error_NIP;
	$error_nama;
	$error_nohp;
	$error_email;
	$error_password;
	$error_passwordBaru;
	$error_confirm;

	$error_idKelas;
	$error_namaKelas;
	$error_detailKelas;

	$error_namaFile;
	$error_detailFile;

	function validateSurname(&$errors, $field_list, $surname, $nim){
		global $error_surname;
		if (!isset($field_list[$surname]) || empty($field_list[$surname])){
			$error_surname = 'Username wajib di isi';
			$errors[$surname] = 'Username wajib di isi';
		}
		else {
			if ($nim == False) {
				$error_surname = "Username anda salah";
				$errors[$surname] = "Username anda salah";
			}
			else if (strlen($field_list[$surname]) < 12 ) {
				$error_surname = "* Username harus 12 digit";
				$errors[$surname] = "* Username harus dari 12 digit";
			}
		}
	}
	function validateNIM(&$errors, $field_list, $NIM){
		global $error_NIM;
		$pattern = "/^[a-zA-Z'-. ]+$/"; // format nama (alfabet)
		if (!isset($field_list[$NIM]) || empty($field_list[$NIM])){
			$error_NIM = ' *di isi dulu ya';
			$errors[$NIM] = ' *di isi dulu ya';
		}
		else {
			if (!preg_match('/^[0-9]*$/', $field_list[$NIM])){
				$error_NIM = "* hanya boleh angka";
				$errors[$NIM] = "* hanya boleh angka";
			}
			else if (strlen($field_list[$NIM]) < 12 || strlen($field_list[$NIM]) > 12) {
				$error_NIM = "* NIM harus dari 12 digit";
				$errors[$NIM] = "* NIM harus dari 12 digit";
			}
		}
	}

	function validateNIP(&$errors, $field_list, $NIP){
		global $error_NIP;
		$pattern = "/^[a-zA-Z'-. ]+$/"; // format nama (alfabet)
		if (!isset($field_list[$NIP]) || empty($field_list[$NIP])){
			$error_NIP = ' *di isi dulu ya';
			$errors[$NIP] = ' *di isi dulu ya';
		}
		else {
			if (!preg_match('/^[0-9]*$/', $field_list[$NIP])){
				$error_NIP = "* hanya boleh angka";
				$errors[$NIP] = "* hanya boleh angka";
			}
			else if (strlen($field_list[$NIP]) < 12 || strlen($field_list[$NIP]) > 12) {
				$error_NIP = "* NIM harus dari 12 digit";
				$errors[$NIP] = "* NIM harus dari 12 digit";
			}
		}
	}

	function validateNama(&$errors, $field_list, $nama){
		global $error_nama;
		$pattern = "/^[a-zA-Z'-. ]+$/"; // format Nama (alfabet)
		if (!isset($field_list[$nama]) || empty($field_list[$nama])){
			$error_nama = ' *di isi dulu ya';
			$errors[$nama] = ' *di isi dulu ya';
		}
		else {
			if (!preg_match($pattern, $field_list[$nama])){
				$error_nama = "* hanya boleh huruf";
				$errors[$nama] = "* hanya boleh huruf";
			}
		}
	}

	function validateNohp(&$errors, $field_list, $Nohp){
		global $error_nohp;
		$pattern = "/^[0-9]*$/"; // format No HP (angka)
		if (!isset($field_list[$Nohp]) || empty($field_list[$Nohp])){
			$error_nohp = ' *di isi dulu ya';
			$errors[$Nohp] = ' *di isi dulu ya';
		}
		else {
			if (!preg_match($pattern, $field_list[$Nohp])){
				$error_nohp = "* hanya boleh angka";
				$errors[$Nohp] = "* hanya boleh angka";
			}
			else if(strlen($field_list[$Nohp]) < 12){
				$error_nohp = "* tidak boleh kurang 12 digit";
				$errors[$Nohp] = "* tidak boleh kurang 12 digit";
			}
		}
	}

	function validateEmail(&$errors, $field_list, $email){
		global $error_email;
		if (!isset($field_list[$email]) || empty($field_list[$email])){
			$error_email = "* di isi dulu ya";
			$errors[$email] = "* di isi dulu ya";
		}
		else {
			if (!filter_var($field_list[$email], FILTER_VALIDATE_EMAIL)){
				$error_email = "* alamat email salah";
				$errors[$email] = "* alamat email salah";
			}
		}	
	}

	function validatePassword(&$errors, $field_list, $password, $pass){
		global $error_password;
		if (!isset($field_list[$password]) || empty($field_list[$password])){
			$error_password = "Password wajib di isi";
			$errors[$password] = "Password wajib di isi";
		}
		else {
			if ($pass == False) {
				$error_password = "Password anda salah";
				$errors[$password] = "Password anda salah";
			}
		}
	}

	function validatePasswordBaru(&$errors, $field_list, $passwordBaru){
		global $error_passwordBaru;
		$pattern1 = "/^[0-9]*$/";
		$pattern2 = "/^[a-zA-Z'-. ]+$/";
		if (!isset($field_list[$passwordBaru]) || empty($field_list[$passwordBaru])){
			$error_passwordBaru = "* di isi dulu ya";
			$errors[$passwordBaru] = "* di isi dulu ya";
		}
		else {
			if (preg_match($pattern1, $field_list[$passwordBaru])){
				$error_passwordBaru = "* Password Harus AlfaNumerik";
				$errors[$passwordBaru] = "* Password Harus AlfaNumerik";
			}
			else if (preg_match($pattern2, $field_list[$passwordBaru])){
				$error_passwordBaru = "* Password Harus AlfaNumerik";
				$errors[$passwordBaru] = "* Password Harus AlfaNumerik";
			}
			else if (strlen($field_list[$passwordBaru]) < 7) {
				$error_passwordBaru = "* password kurang dari 7 digit";
				$errors[$passwordBaru] = "* password kurang dari 7 digit";
			}
		}
	}

	function validateConfirm(&$errors, $field_list, $confirm){
		global $error_confirm;
		if (!isset($field_list[$confirm]) || empty($field_list[$confirm])){
			$error_confirm = "* di isi dulu ya";
			$errors[$confirm] = "* di isi dulu ya";	
		}
		else {
			if ($_POST['passwordBaru'] != $_POST['confirm']){
				$error_confirm = "* password tidak sama";
				$errors[$confirm] = "* password tidak sama";
			}
		}
	}

	function validateIdkelas(&$errors, $field_list, $id){
		global $error_idKelas;
		$pattern = "/^[0-9]*$/";
		if (!isset($field_list[$id]) || empty($field_list[$id])){
			$error_idKelas = "* wajib di isi";
			$errors[$id] = "* wajib di isi";	
		}
		else {
			if (strlen($field_list[$id]) != 3){
				$error_idKelas = "* Id Kelas Harus 3 digit";
				$errors[$id] = "* Id Kelas Harus 3 digit";
			}
			else if (!preg_match($pattern, $field_list[$id])) {
				$error_idKelas = "* Harus berupa angka";
				$errors[$id] = "* Harus berupa angka";	
			}
		}
	}

	function validateNamakelas(&$errors, $field_list, $nama){
		global $error_namaKelas;
		if (!isset($field_list[$nama]) || empty($field_list[$nama])){
			$error_namaKelas = "* wajib di isi";
			$errors[$nama] = "* wajib di isi";	
		}
		else {
			if (strlen($field_list[$nama]) > 30){
				$error_namaKelas = "* tidak boleh lebih dari 30 digit";
				$errors[$nama] = "* tidak boleh lebih dari 30 digit";
			}
		}
	}

	function validateDetailkelas(&$errors, $field_list, $detail){
		global $error_detailKelas;
		if (!isset($field_list[$detail]) || empty($field_list[$detail])){
			$error_detailKelas = "* wajib di isi";
			$errors[$detail] = "* wajib di isi";	
		}
	}

	function validateNamaFile(&$errors, $field_list, $namaFile, $name){
		global $error_namaFile;
		if (!isset($field_list[$namaFile][$name]) || empty($field_list[$namaFile][$name])){
			$error_namaFile = "* wajib di isi";
			$errors[$namaFile][$name] = "* wajib di isi";	
		}
	}

	function validateDetailFile(&$errors, $field_list, $detailFile){
		global $error_detailFile;
		if (!isset($field_list[$detailFile]) || empty($field_list[$detailFile])){
			$error_detailFile = "* wajib di isi";
			$errors[$detailFile] = "* wajib di isi";	
		}
	}
?>