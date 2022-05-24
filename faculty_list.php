<?php

include 'lib/Session.php';
include 'studentsession.php';
include 'class/Format.php';

Session::checkSession();

if (isset($_GET['action']) && isset($_GET['action']) == 'logout') {
    Session::destroy();
    header("Location:index.php");
    exit();
}


include 'class/Student.php';

$student = new Student();
$studentId =  Session::get('id');

$link = mysqli_connect("localhost", "root", "", "onlineexam");
$status = 'OK';
if (mysqli_connect_errno()) {
    $status = 'ERROR';
    $content = mysqli_connect_error();
}


?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Participants List</title>

    <link rel="icon" href="../images/title.png" type="image/png">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<style type="text/css">
      body{
        background-color: #6f1f3a; font-family: 'Times New Roman', serif;"
    }
th{
    font-size: 20px;
}

td{
    font-size: 18px;
}
    
</style>

<body>
    <!--Navigation part starts-->
<?php include 'navbarstudent.php'; ?>
    <!--Navigation part ends-->


    <!-- Exam list part Starts -->


    <div class="container">
        <div class="card">

            <div class="card-header">
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="panel-title">Faculty List</h3>
                    </div>
                </div>
            </div>


            <div class="card-body">

                <?php
                if (isset($result)) {
                    echo $result;
                    unset($result);
                }
                ?>

                <div class="table-responsive">
                    <table id="exam_data_table" class="table table-bordered table-striped table-hover">
                        <thead>
                            <tr>
                                <th>SL</th>
                                <th> Name</th>
                                <th> Email</th>
                                <th>University Name</th>
                                 <th>Message</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                          $query = "SELECT * from faculty_tbl";

                          if ($result = mysqli_query($link, $query)) {
                              /* fetch associative array */
                              $i=1;
                              while ($row = mysqli_fetch_assoc($result)) {
                                  
                            ?>
                                    <tr>

                                        <td><?php echo $i; ?></td>
                                        <td><?php echo $row['name']; ?></td>
                                        <td><?php echo $row['email']; ?></td>
                                        <td><?php echo $row['uni_name']; ?></td>
                                        <td><a href="message.php?id=<?php echo $row['id']; ?>"  >Message</a></td>
                                       
                     
                                        
                                    </tr>
                            <?php
                            $i= $i+1;
                                }
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>
    </div>


</body>

</html>