<?php
    require_once('./sql.php');
    $keys=array('username','password');

    for ($i = 0; $i < count($keys); $i++){
        if(!isset($_POST[$keys[$i]]))

        {
        $response['error'] = true;
        $response['message'] = 'Required Filed Missed';
        echo json_encode($response);
        return;
        }

    }
    $username=$_POST['username'];
    $password=$_POST['password'];

    $stmt = $con->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();
    $stmt->store_result();
    if($stmt->num_rows > 0){

        $stmt->bind_result( $id_user, $nama, $username, $password);
            $stmt->fetch();

            $user = array(
                'id_user'=>$id_user,
                'nama'=>$nama,
                'username'=>$username,
                'password'=>$password

            );

            $stmt->close();
            $response['error'] = false;
            $response['message'] = 'User Loggedin';
            $response['data'] = $user;
    }else
    {
        $response['error'] = true;
        $response['message'] = 'Invalid User Name or Mobile';
        $stmt->close();

    }
    echo json_encode($response);
?>