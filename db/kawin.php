<?php
require_once "koneksi.php";

   if(function_exists($_GET['function'])) {
         $_GET['function']();
      } 

    function get_kawin(){
        global $koneksi;      
        $query = $koneksi->query("select * from kawin");            
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
   
    function get_kawin_id(){
        global $koneksi;
        if (!empty($_GET["id"])) {
            $id = $_GET["id"];      
        } 

        $query ="select * from kawin where id= $id";      
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
    function insert_kawin(){
        global $koneksi;   
        $check = array('tanggal_kawin' => '', 'akta_kawin' => '', 'tempat_kawin' => '');
        $check_match = count(array_intersect_key($_POST, $check));
        
        if($check_match == count($check)){
         
            $result = mysqli_query($koneksi, "insert into kawin set
            id = 'NULL',
            tanggal_kawin = '$_POST[tanggal_kawin]',
            akta_kawin = '$_POST[akta_kawin]',
            tempat_kawin = '$_POST[tempat_kawin]'");
            
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
    function update_kawin(){
        global $koneksi;

        if (!empty($_GET["id"])) {
            $id = $_GET["id"];      
        }   
        $check = array('tanggal_kawin' => '', 'akta_kawin' => '', 'tempat_kawin' => '');
        $check_match = count(array_intersect_key($_POST, $check));

        if($check_match == count($check)){
         
            $result = mysqli_query($koneksi, "update kawin set               
            tanggal_kawin = '$_POST[tanggal_kawin]',
            akta_kawin = '$_POST[akta_kawin]',
            tempat_kawin = '$_POST[tempat_kawin]' where id = $id");
         
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
                     'message' =>'Wrong Parameter'
                  );
         }
         header('Content-Type: application/json');
         echo json_encode($response);
    }
    function delete_kawin(){
        global $koneksi;
        $id = $_GET['id'];
        $query = "delete from kawin where id=".$id;
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