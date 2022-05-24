<?php

include '../lib/Session.php';

include 'session.php'; 


include '../lib/Database.php';
include '../class/Format.php';

Session::checkSession();

if (isset($_GET['action']) && isset($_GET['action']) == 'logout') {
	Session::destroy();
	header("Location:index.php");
	exit();
}


include '../class/Exam.php';

include '../class/Faculty.php';
$exam = new Exam();

$faculty = new Faculty();

$facultyId =  Session::get('id');


$link = mysqli_connect("localhost", "root", "", "onlineexam");
$status = 'OK';
if (mysqli_connect_errno()) {
	$status = 'ERROR';
	$content = mysqli_connect_error();
}


?>
<!DOCTYPE html>
<html>
<head>
	<title>Announcement</title>
	
	<link rel="icon" href="../images/title.png" type="image/png">

	<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="../assets/css/style.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style type="text/css">
	
	 h1{
    
    font-family: 'Times New Roman', serif;
    color: #fff;
    background: -webkit-linear-gradient(#fff, #9999);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-align: center;

}
</style>
<body style=" font-family: 'Times New Roman', serif;">
	<?php
	include 'navbar.php';
	?>

	  <header class="bg-dark text-light py-3">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1><i class="fa-solid fa-pen-to-square"></i>Announcement</h1>
            </div>
        </div>
    </div>
</header>

		

		<form action="" method="POST" style="text-align: center;">
			<textarea name="title" class="card p-5" style="margin-left: 40%;margin-top: 50px"></textarea><br>
			<input type="submit" name="submit" value="Post" class="btn btn-primary">
			<?php
			if(isset($_POST['submit'])){

				$title = $_POST['title'];
				$q1 = "insert into posts (title) values ('$title')";
				$q2 = "insert into notifications (title,read_n) values ('$title','1')";

				$link->query($q1);
				$link->query($q2);
				echo "<br>";

				echo "<b>Notification Posted Successfully</b>";
			}

		?>
			
		</form>
</body>
</html>