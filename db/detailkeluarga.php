<?php
require_once "koneksi.php";

   if(function_exists($_GET['function'])) {
         $_GET['function']();
      } 

    function get_detailkeluarga(){
        global $koneksi;      
        $query = $koneksi->query("select detail_keluarga.id, keluarga.nomor_keluarga, keluarga.status, keluarga.tanggal_keluar, penduduk.nik, penduduk.nama, penduduk.jenis_kelamin, penduduk.agama, penduduk.status_kawin, penduduk.pekerjaan 
                                from keluarga join detail_keluarga 
                                on keluarga.id = detail_keluarga.keluarga_id
                                join penduduk on detail_keluarga.penduduk_id = penduduk.id");            
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
   
    function get_detailkeluarga_id(){
        global $koneksi;
        if (!empty($_GET["id"])) {
            $id = $_GET["id"];      
        } 

        $query ="select detail_keluarga.id, keluarga.nomor_keluarga, keluarga.status, keluarga.tanggal_keluar, penduduk.nik, penduduk.nama, penduduk.jenis_kelamin, penduduk.agama, penduduk.status_kawin, penduduk.pekerjaan 
        from keluarga join detail_keluarga 
        on keluarga.id = detail_keluarga.keluarga_id
        join penduduk on detail_keluarga.penduduk_id = penduduk.id where detail_keluarga.id= $id";      
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
    function insert_detailkeluarga(){
        global $koneksi;   
        $check = array('keluarga_id' => '', 'penduduk_id' => '');
        $check_match = count(array_intersect_key($_POST, $check));
        
        if($check_match == count($check)){
         
            $result = mysqli_query($koneksi, "insert into detail_keluarga set
            keluarga_id = '$_POST[keluarga_id]',
            penduduk_id = '$_POST[penduduk_id]'");
            
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
    function update_detailkeluarga(){
        global $koneksi;

        if (!empty($_GET["id"])) {
            $id = $_GET["id"];      
        }   

        $check = array('keluarga_id' => '', 'penduduk_id' => '');
        $check_match = count(array_intersect_key($_POST, $check));

        if($check_match == count($check)){
         
            $result = mysqli_query($koneksi, "update detail_keluarga set               
            keluarga_id = '$_POST[keluarga_id]',
            penduduk_id = '$_POST[penduduk_id]' where id = $id");
         
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
    function delete_detailkeluarga(){
        global $koneksi;
        $id = $_GET['id'];
        $query = "delete from detail_keluarga where id=".$id;
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