<?php
    require_once "koneksi.php";

    if(function_exists($_GET['function'])) {
        $_GET['function']();
    } 

    function get_user(){
    global $koneksi;      
    $query = $koneksi->query("select * from user");            
    while($row=mysqli_fetch_object($query)){
        $data[] =$row;
    }
    $response=array(
                    'status' => 1,
                    'message' =>'Success',
                    'data' => $data
                );
    header('Content-Type: application/json');
    echo json_encode($response);
    }   