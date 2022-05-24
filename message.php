<?php
    $connect = mysqli_connect( 'localhost', 'root', '', 'onlineexam' )
        or die("Can not connect");  
?>

<?php
 if (!isset($_GET['id']) || $_GET['id'] == NULL){
	 header("Location:");
 }else{
	 $id = $_GET['id'];
 }
?>

<!DOCTYPE html>
<html>
<head>
    <title>Examinee's Message Portal</title>

    <link rel="icon" href="images/title.png" type="image/png">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background-color: #6f1f3a; font-family: 'Times New Roman', serif; color: #ffffff;">
<div style="padding: 50px;">


<h2>Add New Message</h2>
    <?php
    if (isset($_POST['msg']) && !empty($_POST['msg'])){
        $msg=$_POST['msg'];
            if (empty($msg)){
                    echo "<span class='error'>Field must not be empty ! </span>";//3
            }else{
               
                $inserted_rows = mysqli_query( $connect,"INSERT INTO msg_tbl (rec_id,message) VALUES ($id,'$msg')")
                or die("Can not execute query");
                if ($inserted_rows) {
                    echo "<span class='success'>Message sent successfully!</span>";
                }else{
                    echo "<span class='success'>Message cannot be sent </span>";
                }
            }
    
}
?>
                 <form action="" method="post">
                    <table class="form">					
                        <tr>
                            <td>
                                <input type="text" name="msg" placeholder="Enter Message..." /><br><br>
                            </td>
                        </tr>
						<tr> 
                            <td>
                                <input type="submit" name="submit" Value="Save" /><br><br>
                                <!-- <input type="button" name=""> -->
                            </td>
                        </tr>
                    </table>
                     <pre><button><a href="yourmessage.php" style="text-decoration: none;">See your messages</a></button>   <button><a href="faculty/yourmessage.php" style="text-decoration: none;">See examiners messsages</a></button></pre>
                    </form>
</div>
    


</body>
</html>

