<?php
    include "sql.php";

    if(isset($_GET['index'])){
        $index = mysqli_query($con, "select * from wilayah");
        if($index){
            //return success
        }else{
            // return error
        }

    }else if(isset($_POST['insert'])){
        $rt = $_POST['rt'];
        $rw = $_POST['rw'];
        $kelurahan = $_POST['kelurahan'];
        $kecamatan = $_POST['kecamatan'];
        $kabupaten = $_POST['kabupaten'];
        $provinsi = $_POST['provinsi'];

        $insert = mysqli_query($con, "insert into wilayah values (NULL, '$rt', '$rw', '$kelurahan', '$kecamatan', '$kabupaten', '$provinsi')");
        if($insert){
            // return success
        }else{
            // return error
        }
    
    }else if(isset($_POST['update'])){
        $id = $_POST['id'];
        $rt = $_POST['rt'];
        $rw = $_POST['rw'];
        $kelurahan = $_POST['kelurahan'];
        $kecamatan = $_POST['kecamatan'];
        $kabupaten = $_POST['kabupaten'];
        $provinsi = $_POST['provinsi'];
    
        $update = mysqli_query($con, "update wilayah set rt='$rt', rw='$rw', kelurahan='$kelurahan', kecamatan='$kecamatan', kabupaten='$kabupaten', provinsi='$provinsi' where id='$id'");
        if($update){
            //return success
        }else{
            //return error
        }
    
    }else if(isset($_GET['delete'])){
        $id = $_GET['id'];

        $delete = mysqli_query($con, "delete from wilayah where id='$id'");
        if($delete){
            //return success
        }else{
            //return error
        }
    
    }else if(isset($_GET['show'])){
        $id = $_GET['id'];
        
        $show = mysqli_query($con, "select * from wilayah where id='$id'");
        if($show){
            //return success
        }else{
            //return error
        }
    }