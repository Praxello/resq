<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
include "../connection.php";
mysqli_set_charset($conn, 'utf8');
$response = null;
$records  = null;
extract($_POST);
if (isset($_POST['password']) && isset($_POST['email'])) {
    $sql      = "SELECT u.userid,u.roleid,u.categoryid,u.businessname,u.firstname,u.lastname 
    FROM users u WHERE u.password = '$password' AND u.email = '$email' AND u.isactive = 1";
    $jobQuery = mysqli_query($conn, $sql);
    if ($jobQuery != null) {
        $academicAffected = mysqli_num_rows($jobQuery);
        if ($academicAffected > 0) {
            $academicResults = mysqli_fetch_assoc($jobQuery);
            $records         = $academicResults;
            $response        = array(
                'Message' => "User authenticated successfully",
                "Data" => $records,
                'Responsecode' => 200
            );
        } else {
            $response = array(
                'Message' => "No user present/ Invalid username or password",
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
} else {
    $response = array(
        'Message' => "Parameter Missing",
        "Data" => $records,
        'Responsecode' => 402
    );
}
mysqli_close($conn);
exit(json_encode($response));
?>