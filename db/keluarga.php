<?php
    include "sql.php";

    if(isset($_GET['index'])){
        $index = mysqli_query($con, "select * from keluarga");
        if($index){
            //return success
        }else{
            // return error
        }

    }else if(isset($_POST['insert'])){
        $id_wilayah = $_POST['id_wilayah'];
        $nomor_keluarga = $_POST['nomor_keluarga'];
        $status = $_POST['status'];
        $alamat = $_POST['alamat'];
        $tanggal_keluar = $_POST['tanggal_keluar'];

        $insert = mysqli_query($con, "insert into keluarga values ('null', '$id_wilayah', '$nomor_keluarga', '$status', '$alamat', '$tanggal_keluar')");
        if($insert){
            // return success
        }else{
            // return error
        }

    }else if(isset($_POST['update'])){
        $id = $_POST['id'];
        $id_wilayah = $_POST['id_wilayah'];
        $nomor_keluarga = $_POST['nomor_keluarga'];
        $status = $_POST['status'];
        $alamat = $_POST['alamat'];
        $tanggal_keluar = $_POST['tanggal_keluar'];

        $update = mysqli_query($con, "update keluarga set id_wilayah='$id_wilayah', nomor_keluaraga='$nomor_keluaraga', status='$status', alamat='$alamat', tanggal_keluar='$tanggal_keluar', where id='$id'");
        if($update){
            //return success
        }else{
            //return error
        }

    }else if(isset($_GET['delete'])){
        $id = $_GET['id'];

        $delete = mysqli_query($con, "delete from keluarga where id='$id'");
        if($delete){
            //return success
        }else{
            //return error
        }
        
    }else if(isset($_GET['show'])){
        $id = $_GET['id'];

        $show = mysqli_query($con, "select * from keluarga where id='$id'");
        if($show){
            //return success
        }else{
            //return error
        }

    }
