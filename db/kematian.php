<?php
require_once "koneksi.php";

   if(function_exists($_GET['function'])) {
         $_GET['function']();
      } 

    function get_kematian(){
        global $koneksi;      
        $query = $koneksi->query("select penduduk.nik, penduduk.nama, penduduk.jenis_kelamin, penduduk.agama, penduduk.status_kawin, penduduk.pekerjaan, kematian.tempat, kematian.hari, kematian.tanggal, kematian.sebab from penduduk join kematian on penduduk.id = kematian.penduduk_id");            
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
   
    function get_kematian_id(){
        global $koneksi;
        if (!empty($_GET["id"])) {
            $id = $_GET["id"];      
        } 

        $query ="select penduduk.id, penduduk.nik, penduduk.nama, penduduk.jenis_kelamin, penduduk.agama, penduduk.status_kawin, penduduk.pekerjaan, kematian.tempat, kematian.hari, kematian.tanggal, kematian.sebab from penduduk join kematian on penduduk.id = kematian.penduduk_id where kematian.id= $id";      
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
    function insert_kematian(){
        global $koneksi;   
        $check = array('penduduk_id' => '', 'tempat' => '', 'hari' => '', 'tanggal' => '', 'sebab' => '');
        $check_match = count(array_intersect_key($_POST, $check));
        
        if($check_match == count($check)){
         
            $result = mysqli_query($koneksi, "insert into kematian set
            id = 'NULL',
            penduduk_id = '$_POST[penduduk_id]',
            tempat = '$_POST[tempat]',
            hari = '$_POST[hari]',
            tanggal = '$_POST[tanggal]',
            sebab = '$_POST[sebab]'");

            $last_id_kematian = mysqli_insert_id($koneksi);

            $result2 = mysqli_query($koneksi, "update penduduk set
            kematian_id = '$last_id_kematian' where id = $_POST[penduduk_id]");

            
            if($result2){
                $response=array(
                    'status' => 1,
                    'message' =>'Insert Success',
                );
            }else{
                $response=array(
                    'status' => 0,
                    'message' =>'Insert Failed.',
                );
            }

         }else{
            $response=array(
                     'status' => 0,
                     'message' =>'Wrong Parameter 1'
                  );
         }
         header('Content-Type: application/json');
         echo json_encode($response);
    }
    function update_kematian(){
        global $koneksi;

        if (!empty($_GET["id"])) {
            $id = $_GET["id"];      
        }   
        $check = array('tempat' => '', 'hari' => '', 'tanggal' => '', 'sebab' => '');
        $check_match = count(array_intersect_key($_POST, $check));

        if($check_match == count($check)){
         
            $result = mysqli_query($koneksi, "update kematian set               
            tempat = '$_POST[tempat]',
            hari = '$_POST[hari]',
            tanggal = '$_POST[tanggal]',
            sebab = '$_POST[sebab]' where id = $id");
         
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
    function delete_kematian(){
        global $koneksi;
        $id = $_GET['id'];
        $query = "delete from kematian where id=".$id;
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