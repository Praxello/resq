<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
include "../connection.php";
mysqli_set_charset($conn, 'utf8');
$response = null;
$records  = null;
//typeofadd 1-header,2-footer,3 cources
$sql      = "SELECT ad.adid,ad.bannertitle,ad.articletitle,ad.description,ad.fullarticle,ad.fullarticle,ad.imageurl,ad.websitelink,ad.typeofad,ad.addestination,ad.areaid,sa.country,sa.areaname,sa.district 
    FROM advertisements ad LEFT JOIN servicearea sa USING(areaid) ORDER BY ad.typeofad";
$jobQuery = mysqli_query($conn, $sql);
if ($jobQuery != null) {
    $academicAffected = mysqli_num_rows($jobQuery);
    if ($academicAffected > 0) {
        while ($academicResults = mysqli_fetch_assoc($jobQuery)) {
            $records[] = $academicResults;
        }
        
        $response = array(
            'Message' => "Advertisement data loaded successfully",
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