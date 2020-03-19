<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
include "../connection.php";
mysqli_set_charset($conn, 'utf8');
$response = null;
$records  = null;
extract($_POST);
if (isset($_POST['quizid'])) {
    $sql      = "SELECT qm.questionid,qm.questiontype,qm.difficultylevel,qm.question,qm.option1,qm.answer1,qm.option2,qm.answer2,qm.option3,qm.answer3,qm.option4,qm.answer4,qm.answerdetails,qm.mediaUrl 
FROM questionsmaster qm WHERE qm.quizid = $quizid AND qm.isActive =1";
    $jobQuery = mysqli_query($conn, $sql);
    if ($jobQuery != null) {
        $academicAffected = mysqli_num_rows($jobQuery);
        if ($academicAffected > 0) {
            while ($academicResults = mysqli_fetch_assoc($jobQuery)) {
                $records[] = $academicResults;
            }
            
            $response = array(
                'Message' => "Questions data loaded successfully",
                "Data" => $records,
                'Responsecode' => 200
            );
        } else {
            $response = array(
                'Message' => "Questions are not found for this quiz",
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
        'Message' => 'Parameter missing',
        "Data" => $records,
        'Responsecode' => 402
    );
}
mysqli_close($conn);
exit(json_encode($response));
?>