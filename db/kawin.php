<?php
    include "sql.php";

    if(isset($_GET['index'])){
        $index = mysqli_query($con, "select * from kawin");
        if($index){
            //return success
        }else{
            // return error
        }
    
    }else if(isset($_POST['insert'])){
        $tanggal_akad = $_POST['tanggal_akad'];
        $akta_nikah = $_POST['akta_nikah'];
        $tempat_nikah = $_POST['tempat_nikah'];

        $insert = mysqli_query($con, "insert into kawin values (NULL, '$tanggal_akad', '$akta_nikah', '$tanggal_akad')");
        if($insert){
            //return success
        }else{
            //return error
        }

    }else if(isset($_POST['update'])){
        
    }else if(isset($_GET['delete'])){

    }else if(isset($_GET['show'])){

    }