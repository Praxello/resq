<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
include "../connection.php";
if ($_POST['AlgoId']) {
    $AlgoId = $_POST['AlgoId'];
    $NodeId = getNodeId($AlgoId);
    $algo_array = getDetails($AlgoId, $NodeId);
    mysqli_close($con);
    exit(json_encode($algo_array));
}

function getDetails($AlgoId, $NodeId) {
    global $con;
    $query = "SELECT * FROM algos_table WHERE AlgoId=$AlgoId AND NodeId=$NodeId";
    $rows = mysqli_query($con, $query);
    $algo_array=null;
    if (mysqli_num_rows($rows) > 0) {
        while ($row = mysqli_fetch_assoc($rows)) {
            if ($row['NextNodeType'] == 'Choice') {
                $algo_array = $row;
                $algo_array[]= getChoices($AlgoId, $NodeId);
            } else {
                $algo_array = $row;
            }
        }
    }
    return $algo_array;
}

function getChoices($AlgoId, $NodeId) {
    global $con;
    if ($con) {
        $query = "SELECT * FROM algo_choice_table WHERE AlgoId=$AlgoId AND NodeId=$NodeId";
        $choices = mysqli_query($con, $query);
        $choice_array=null;
        if (mysqli_num_rows($choices) > 0) {
            while ($choice = mysqli_fetch_assoc($choices)) {
            $choice_array[]=[$choice,getDetails($choice['AlgoId'], $choice['ReturningNode'])];
            }
        }
        return $choice_array;
    }
}

function getNodeId($AlgoId) {
    global $con;
    if ($con) {
        $query = "SELECT NodeId FROM algos_table WHERE AlgoId=$AlgoId ORDER BY NodeId ASC LIMIT 1";
        $rows = mysqli_query($con, $query);
        $NodeId=null;
        if (mysqli_num_rows($rows) > 0) {
            while ($row = mysqli_fetch_assoc($rows)) {
                $NodeId = $row['NodeId'];
            }
        }

        return $NodeId;
    }
}

?>   