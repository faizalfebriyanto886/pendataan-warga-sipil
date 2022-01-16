<?php
    include "sql.php";

    if(isset($_GET['index'])){
        $index = mysqli_query($con, "select * from kelahiran join penduduk on kelahiran.id_kelahiran = penduduk.id_kelahiran");
        if($index){
            //return success
        }else{
            // return error
        }

    }if(isset($_POST['insert'])){
        //form kelahiran 
        $nomor_kelahiran = $_POST['nomor_kelahiran'];
        $tempat = $_POST['tempat'];
        $hari = $_POST['hari'];
        $tanggal = $_POST['tanggal'];
        $keterangan = $_POST['keterangan'];

        //form penduduk
        $nama = $_POST['nama'];
        $jenis_kelamin = $_POST['jenis_kelamin'];
        $agama = $_POST['agama'];
        $status_kawin = $_POST['status_kawin'];
        $pekerjaan = $_POST['pekerjaan'];

        $insert = mysqli_query($con, "insert into kelahiran values ('null', 'null', '$nomor_kelahiran', '$tempat', '$hari', '$tanggal', '$keterangan')");
        if($insert){
            $last_id = mysqli_insert_id($con);
            $insert_pendududuk = mysqli_query($con, "insert into penduduk value ('null', '$last_id', '$nama', '$jenis_kelamin', '$agama', '$status_kawin', '$pekerjaan')");

            if($insert_pendududuk){
                //return success
            }else{
                //return error
            }

        }else{
            //return error
        }

    }if(isset($_POST['update'])){
        $id = $_POST['id'];
        $nomor_kelahiran = $_POST['nomor_kelahiran'];
        $tempat = $_POST['tempat'];
        $hari = $_POST['hari'];
        $tanggal = $_POST['tanggal'];
        $keterangan = $_POST['keterangan'];

        $update = mysqli_query($con, "update kelahiran set nomor_kelahiran='$nomor_kelahiran', tempat='$tempat', hari='$hari', tanggal='$tanggal', keterangan='$keterangan' where id='$id'");
        if($update){
            //return success
        }else{
            //return error
        }

    }if(isset($_GET['delete'])){
        $id = $_GET['id'];

        $delete = mysqli_query($con, "delete from kelahiran where id='$id'");
        if($delete){
            //return success
        }else{
            //return error
        }

    }if(isset($_GET['show'])){
        $id = $_GET['id'];
        
        $show = mysqli_query($con, "select * from kelahiran where id='$id'");
        if($show){
            //return success
        }else{
            //return error
        }
    }
