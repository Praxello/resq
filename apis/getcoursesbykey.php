<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
include "../connection.php";
mysqli_set_charset($conn, 'utf8');
$response   = null;
$mainResult = array();

$query = mysqli_query($conn, "SELECT * FROM courseheader");
if ($query != null) {
    $Affected = mysqli_num_rows($query);
    if ($Affected > 0) {
        while ($results = mysqli_fetch_assoc($query)) {
            
            $Category = $results['branch'];
            $temp     = $results;
            
            if (array_key_exists($Category, $mainResult)) {
                $mainResult["$Category"][] = $temp;
            } else {
                $mainResult["$Category"][] = $temp;
            }
        }
        $response = array(
            'Message' => "All cources fetched Successfully" . mysqli_error($conn),
            "Data" => $mainResult,
            'Responsecode' => 200
        );
    } else {
        $response = array(
            'Message' => "No records found" . mysqli_error($conn),
            'Responsecode' => 402
        );
    }
} else {
    $response = array(
        'Message' => mysqli_error($conn),
        'Responsecode' => 202
    );
}
mysqli_close($conn);
exit(json_encode($response));
?>