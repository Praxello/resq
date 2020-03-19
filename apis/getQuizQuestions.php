<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
include "../connection.php";
mysqli_set_charset($conn, 'utf8');
$response = null;
$records  = null;
extract($_POST);
if (isset($_POST['conditionid'])) {
    $sql      = "SELECT qm.quizid,qm.userId,qm.conditionid,qm.title,qm.details,qm.passingscore,qm.questiontimeout,qm.questiontimeout
     FROM quizmaster qm WHERE qm.isActive = 1 AND qm.conditionid = $conditionid";
    $jobQuery = mysqli_query($conn, $sql);
    if ($jobQuery != null) {
        $academicAffected = mysqli_num_rows($jobQuery);
        if ($academicAffected > 0) {
            $academicResults = mysqli_fetch_assoc($jobQuery);
            $quizid          = $academicResults['quizid'];
            $temp            = null;
            $sql_1           = "SELECT qm.questionid,qm.questiontype,qm.difficultylevel,qm.question,qm.option1,qm.answer1,qm.option2,qm.answer2,qm.option3,qm.answer3,qm.option4,qm.answer4,qm.answerdetails,qm.mediaUrl 
            FROM questionsmaster qm WHERE qm.quizid = $quizid AND qm.isActive =1";
            $jobQuery_1      = mysqli_query($conn, $sql_1);
            
            $academicAffected = mysqli_num_rows($jobQuery_1);
            if ($academicAffected > 0) {
                while ($academicResults_1 = mysqli_fetch_assoc($jobQuery_1)) {
                    $temp[] = $academicResults_1;
                }
            }
            $result  = array(
                'Questions' => $temp
            );
            $records = array_merge($academicResults, $result);
            
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