<?php
require_once "koneksi.php";

   if(function_exists($_GET['function'])) {
         $_GET['function']();
      } 

    function get_alamat(){
        global $koneksi;      
        $query = $koneksi->query("select * from alamat");            
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
   
    function get_alamat_id(){
        global $koneksi;
        if (!empty($_GET["id"])) {
            $id = $_GET["id"];      
        } 

        $query ="select * from alamat where id= $id";      
        $result = $koneksi->query($query);

        while($row = mysqli_fetch_object($result)){
            $data[] = $row;
        } 

        if($data){
        $response = array(
                        'status' => 1,
                        'message' =>'Success',
                        'data' => $data
                    );               
        }else {
            $response=array(
                        'status' => 0,
                        'message' =>'No Data Found'
                    );
        }
        
        header('Content-Type: application/json');
        echo json_encode($response);
        
    }
    function insert_alamat(){
        global $koneksi;   
        $check = array('wilayah_id' => '', 'jalan' => '', 'nomor' => '');
        $check_match = count(array_intersect_key($_POST, $check));
        
        if($check_match == count($check)){
         
            $result = mysqli_query($koneksi, "insert into alamat set
            id = 'NULL',
            wilayah_id = '$_POST[wilayah_id]',
            jalan = '$_POST[jalan]',
            nomor = '$_POST[nomor]'");
            
            if($result){
                $response=array(
                    'status' => 1,
                    'message' =>'Insert Success'
                );
            }else{
                $response=array(
                    'status' => 0,
                    'message' =>'Insert Failed.'
                );
            }

         }else{
            $response=array(
                     'status' => 0,
                     'message' =>'Wrong Parameter'
                  );
         }
         header('Content-Type: application/json');
         echo json_encode($response);
    }
    function update_alamat(){
        global $koneksi;

        if (!empty($_GET["id"])) {
            $id = $_GET["id"];      
        }   
        $check = array('wilayah_id' => '', 'jalan' => '', 'nomor' => '');
        $check_match = count(array_intersect_key($_POST, $check));

        if($check_match == count($check)){
         
            $result = mysqli_query($koneksi, "update alamat set               
            wilayah_id = '$_POST[wilayah_id]',
            jalan = '$_POST[jalan]',
            nomor = '$_POST[nomor]' where id = $id");
         
            if($result){
               $response=array(
                  'status' => 1,
                  'message' =>'Update Success'                  
               );
            }else{
               $response=array(
                  'status' => 0,
                  'message' =>'Update Failed'                  
               );
            }
         }else{
            $response=array(
                     'status' => 0,
                     'message' =>'Wrong Parameter',
                     'data'=> $id
                  );
         }
         header('Content-Type: application/json');
         echo json_encode($response);
    }
    function delete_alamat(){
        global $koneksi;
        $id = $_GET['id'];
        $query = "delete from alamat where id=".$id;
        if(mysqli_query($koneksi, $query)){
            $response=array(
            'status' => 1,
            'message' =>'Delete Success'
            );
        }else{
            $response=array(
            'status' => 0,
            'message' =>'Delete Fail.'
            );
        }
        header('Content-Type: application/json');
        echo json_encode($response);
    }
 ?>