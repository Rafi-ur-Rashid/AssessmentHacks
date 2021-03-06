<?php
include 'lib/Session.php';

include 'studentsession.php';


include 'lib/Database.php';
include 'class/Format.php';

Session::stdCheckLogin();

include 'class/Student.php';

$student = new Student();


if ($_SERVER["REQUEST_METHOD"] == "POST") {
	$email = $_POST['email'];
	$password = md5($_POST['password']);

	$message = $student->studentLogin($email, $password);
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Student Login</title>

	<link rel="icon" href="images/title.png" type="image/png">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/style.css">
</head>

<style type="text/css">
	  body{
    background-color: #ffffff;
    font-family: 'Times New Roman', serif;
    color: #ffffff;
  }


  .btn-danger{
    color:#ffffff ;
    background-color: #ff5c0b;
  }
  .btn-danger:hover {
    color: #ffffff;
    border-color: #ff5c0b;
}

   

</style>

<body>
	<div class="containter-fluid p-5  ">
		<div class="row mt-5 mb-5 pb-5 ">
			<div class="card col-5 offset-lg-4 hero-card" style="background-color: #6f1f3a; color: #ffffff;">
				<h2 class="text-light display-4 d-flex justify-content-center">Examinee Login</h2>
				<hr>

				<?php
				if (isset($message)) {
					echo $message;
					unset($message);
				}
				?>
				<form action="" method="POST" class="form-group">
					<label for="email">Email</label>:
					<input class="form-control" type="Email" id="email" name="email" placeholder="Email" required><br>
					<label for="password">Password</label>:
					<input class="form-control" type="Password" id="password" name="password" placeholder="Password" required><br>
					<input class="btn btn-danger col-2 " type="submit" value="Login"><br><br>
					<p> <a href="student_registration.php" style="color:#ffffff;">Not a registered user? Click Here</a></p>

				</form>

			</div>
		</div>
	</div>

</body>

</html>