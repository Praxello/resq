<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
include "../connection.php";
mysqli_set_charset($conn, 'utf8');
$response = null;
$records  = null;
extract($_POST);
if(isset($_POST['userid'])){
$sql      = "SELECT DATE_FORMAT(qa.quizdate,'%d %M %Y') quizdate,ch.title,ch.coursetype,ch.credits,DATE_FORMAT(cd.expirydate,'%d %M %Y') expiryDate,DATEDIFF(cd.expirydate,CURRENT_DATE) expiry FROM quizanswers qa INNER JOIN quizmaster qm ON qm.quizid = qa.quizid
INNER JOIN courseheader ch ON ch.conditionid = qm.conditionid INNER JOIN coursedetail cd ON cd.productid = ch.productid
WHERE qa.userid =  $userid";
$jobQuery = mysqli_query($conn, $sql);
if ($jobQuery != null) {
    $academicAffected = mysqli_num_rows($jobQuery);
    if ($academicAffected > 0) {
        $totalCredits = 0;
        $temp = null;
        while ($academicResults = mysqli_fetch_assoc($jobQuery)) {
            $credits = $academicResults['expiry'];
            if($credits > 0){
                $totalCredits += intval($academicResults['credits']);
            }
            $temp[] = $academicResults;
        }
        $records['cources'] = $temp;
        $records['totalcredits'] = $totalCredits;
        $response = array(
            'Message' => "Course details data loaded successfully",
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
        'Message' =>'Parameter missing',
        "Data" => $records,
        'Responsecode' => 402
    ); 
}
mysqli_close($conn);
exit(json_encode($response));
?>