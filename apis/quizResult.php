<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
include "../connection.php";
mysqli_set_charset($conn, 'utf8');
$response = null;
$records  = null;
extract($_POST);
if(isset($_POST['quizid']) && isset($_POST['userid']) && isset($_POST['score']) && isset($_POST['quizdate'])){
$sql      = "INSERT INTO quizanswers(quizid,userid,score,quizdate) VALUES($quizid,$userid,'$score','$quizdate')";
$jobQuery = mysqli_query($conn, $sql);
  
if($jobQuery != null){
$rowsAffected = mysqli_affected_rows($conn);
if ($rowsAffected == 1) {
    $answerid = $conn->insert_id;
    $sql = "SELECT * FROM quizanswers WHERE answerid = $answerid";
    $jobQuery = mysqli_query($conn, $sql);
    $academicAffected = mysqli_num_rows($jobQuery);
    if ($academicAffected > 0) {
        $academicResults = mysqli_fetch_assoc($jobQuery);
            $records = $academicResults;
    }
    $response = array(
        'Message' => "Result loaded successfull",
        "Data" => $records,
        'Responsecode' => 200
    );
} else {
        $response = array(
            'Message' => "No data present",
            "Data" => $records,
            'Responsecode' => 404
        );
    }
} else {
    $response = array(
        'Message' => mysqli_error($conn),
        "Data" => $records,
        'Responsecode' => 500
    );
}
}else{
    $response = array(
        'Message' => 'Parameter Missing',
        "Data" => $records,
        'Responsecode' => 402
    );
}
mysqli_close($conn);
exit(json_encode($response));
?>