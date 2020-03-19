<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
include "../connection.php";
if ($_POST['AlgoId']) {
    $AlgoId = $_POST['AlgoId'];
    $NodeId = getNodeId($AlgoId);
//    echo 'NodeId='.$NodeId;
    $algo_array = array();
    $algo_array = getAlgo($AlgoId, $NodeId);
//    print_r($algo_array);
//   echo json_encode($algo_array);
    mysqli_close($conn);
exit(json_encode($algo_array));
}

function getNodeId($AlgoId) {
    global $conn;
    if ($conn) {
        $query = "SELECT NodeId FROM algos_table WHERE AlgoId=$AlgoId ORDER BY NodeId ASC LIMIT 1";
//        echo $query;die;
        $rows = mysqli_query($conn, $query);
        $NodeId=null;
        if (mysqli_num_rows($rows) > 0) {
            while ($row = mysqli_fetch_assoc($rows)) {
                $NodeId = $row['NodeId'];
            }
        }

        return $NodeId;
    }
}

function getAlgo($AlgoId, $NodeId) {
    global $conn;
    if ($conn) {
        $query = "SELECT * FROM algos_table WHERE AlgoId=$AlgoId AND NodeId=$NodeId";
        $rows = mysqli_query($conn, $query);
        $Algo_array = array();
        if (mysqli_num_rows($rows) > 0) {
            while ($row = mysqli_fetch_assoc($rows)) {
                $Algo_array = $row;
                if ($row['NextNodeType'] == 'Choice') {
                    $Algo_array[]=getChoices($AlgoId, $NodeId);
                }
            }
        }
        return $Algo_array;
    }
}
    function getChoices($AlgoId, $NodeId) {
        global $conn;
        if ($conn) {
            $query = "SELECT * FROM algo_choice_table WHERE AlgoId=$AlgoId AND NodeId=$NodeId";
            $choices = mysqli_query($conn, $query);
            if (mysqli_num_rows($choices) > 0) {
                $choice_array = array();
                while($choice = mysqli_fetch_assoc($choices)) {
//                $choice_array['NodeText']= $choice;
                    $choice_array[]=$choice;
                    $choice_array[]=getAlgo($choice['AlgoId'], $choice['ReturningNode']);
                }
            }
            return $choice_array;
        }
    }

 ?>   