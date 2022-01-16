<?php
    include "sql.php";

    if(isset($_GET['index'])){
        $index = mysqli_query($con, "select * from penduduk");
        if($index){
            //return success
        }else{
            // return error
        }

    }else if(isset($_POST['update'])){
        $nik = $_POST['nik'];
        $nama = $_POST['nama'];
        $jenis_kelamin = $_POST['jenis_kelamin'];
        $agama = $_POST['agama'];
        $status_kawin = $_POST['status_kawin'];
        $pekerjaan = $_POST['pekerjaan'];

        $update = mysqli_query($con, "update penduduk set nama='$nama', jenis_kelamin='$jenis_kelamin', agama='$agama', status_kawin='$status_kawin', pekerjaan='$pekerjaan' where nik = '$nik'");
        if($update){
            //return success
        }else{
            //return error
        }

    }else if(isset($_POST['insert kk'])){
        $nik = $_POST['nik'];
        $id_keluarga = $_POST['id_keluarga'];

        $insertkk = mysqli_query($con, "insert into detail_keluarga values ('$nik', '$id_keluarga' ");
        if($insertkk){
            //return success
        }else{
            // return error
        }

    }else if(isset($_GET['delete'])){
        $nik = $_GET['nik'];

        $deletedetailkk = mysqli_query($con, "delete from detail_keluarga where nik='$nik'");
        $delete = mysqli_query($con, "delete from penduduk where nik='$nik'");
        if($delete){
            //return success
        }else{
            //return error
        }
    }