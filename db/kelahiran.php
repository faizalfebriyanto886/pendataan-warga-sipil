<?php
require_once "koneksi.php";

   if(function_exists($_GET['function'])) {
         $_GET['function']();
      } 

    function get_kelahiran(){
        global $koneksi;      
        $query = $koneksi->query("select kelahiran.nomor_kelahiran, kelahiran.tempat, kelahiran.hari, kelahiran.tanggal, kelahiran.keterangan, penduduk.nama, penduduk.jenis_kelamin, penduduk.agama from kelahiran join penduduk on kelahiran.penduduk_id = penduduk.id");            
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
   
    function get_kelahiran_id(){
        global $koneksi;
        if (!empty($_GET["id"])) {
            $id = $_GET["id"];      
        } 

        $query ="select kelahiran.nomor_kelahiran, kelahiran.tempat, kelahiran.hari, kelahiran.tanggal, kelahiran.keterangan, penduduk.nama, penduduk.jenis_kelamin, penduduk.agama from kelahiran join penduduk on kelahiran.penduduk_id = penduduk.id where kelahiran.id =".$id;      
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
    function insert_kelahiran(){
        global $koneksi;   
        $check = array('nomor_kelahiran' => '', 'tempat' => '', 'hari' => '', 'tanggal' => '', 'keterangan' => '');
        $check_match = count(array_intersect_key($_POST, $check));
        
        if($check_match == count($check)){
         
            $result = mysqli_query($koneksi, "insert into kelahiran set
            id = 'NULL',
            nomor_kelahiran = '$_POST[nomor_kelahiran]',
            tempat = '$_POST[tempat]',
            hari = '$_POST[hari]',
            tanggal = '$_POST[tanggal]',
            keterangan = '$_POST[keterangan]'");

            $last_id_kelahiran = mysqli_insert_id($koneksi);

        
            $result2 = mysqli_query($koneksi, "insert into penduduk set
            id = 'NULL',
            kelahiran_id = $last_id_kelahiran,
            nik = '$_POST[nik]',
            nama = '$_POST[nama]',
            jenis_kelamin = '$_POST[jenis_kelamin]',
            agama = '$_POST[agama]',
            status_kawin = '$_POST[status_kawin]',
            pekerjaan = '$_POST[pekerjaan]'");

            $last_id_penduduk = mysqli_insert_id($koneksi);

            $result3 = mysqli_query($koneksi, "update kelahiran set
            penduduk_id = $last_id_penduduk where id = $last_id_kelahiran");

            
            if($result2){
                $response=array(
                    'status' => 1,
                    'message' =>'Insert Success',
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
                     'message' =>'Wrong Parameter 1'
                  );
         }
         header('Content-Type: application/json');
         echo json_encode($response);
    }
    function update_kelahiran(){
        global $koneksi;

        if (!empty($_GET["id"])) {
            $id = $_GET["id"];      
        }   
        $check = array('nomor_kelahiran' => '', 'tempat' => '', 'hari' => '', 'tanggal' => '', 'keterangan' => '');
        $check_match = count(array_intersect_key($_POST, $check));

        if($check_match == count($check)){
         
            $result = mysqli_query($koneksi, "update kelahiran set               
            nomor_kelahiran = '$_POST[nomor_kelahiran]',
            tempat = '$_POST[tempat]',
            hari = '$_POST[hari]',
            tanggal = '$_POST[tanggal]',
            keterangan = '$_POST[keterangan]' where id = $id");
         
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
    function delete_kelahiran(){
        global $koneksi;
        $id = $_GET['id'];
        $query = "delete from kelahiran where id=".$id;
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