<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
include "../connection.php";
mysqli_set_charset($conn, 'utf8');
$response = null;
$records  = null;
$sql      = "SELECT ch.productid,ch.coursetype,ch.title,ch.description,ch.cost,ch.branch,ch.systemid,ch.conditionid,ch.lifethreatning,ch.credits,ch.instructor,ch.startdate,ch.enddate,u.firstname,u.lastname 
FROM courseheader ch LEFT JOIN users u ON u.userid = ch.instructor";
$jobQuery = mysqli_query($conn, $sql);
if ($jobQuery != null) {
    $academicAffected = mysqli_num_rows($jobQuery);
    if ($academicAffected > 0) {
        while ($academicResults = mysqli_fetch_assoc($jobQuery)) {
            $records[] = $academicResults;
        }
        
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
mysqli_close($conn);
exit(json_encode($response));
?>