<?php
require_once('models/connection.php');
require_once('controllers/post.controller.php');

if (isset($_POST)){

    /*================================================
    Separar propiedades en un arreglo
    =================================================*/

    $columns = array();

    foreach(array_keys($_POST) as $key => $value){
        
        array_push($columns, $value);
       
    }

    /*================================================
    validar la tabla y las columnas
    =================================================*/

    if (empty(Connection::getColumnsData($table, $columns))){

        $json = array(
            "status" => 404,
            "comment" => "La tabla o las columnas no existen"
        );

        echo json_encode($json, http_response_code($json['status']));

        return;
        
    }

    $response = new PostController();

    /*================================================
    Peticion Post para registrar usuario
    =================================================*/

    if (isset($_GET['register']) && $_GET['register'] == 'true'){

        $suffix = $_GET['suffix'] ?? 'user';

        $response -> postRegister($table, $_POST, $suffix);

        /*================================================
        Peticion Post para login de usuario
        =================================================*/

    }else if (isset($_GET['login']) && $_GET['login'] == 'true'){

        $suffix = $_GET['suffix'] ?? 'user';

        $response -> postLogin($table, $_POST, $suffix);
            
    }else{

        if(isset($_GET['token'])){

            /*================================================
            Peticion Post para usuarios no autorizados
            =================================================*/

            if($_GET['token'] == 'no' && isset($_GET['except'])){

                /*================================================
                validar la tabla y las columnas
                =================================================*/

                $columns = array($_GET['except']);

                if (empty(Connection::getColumnsData($table, $columns))){

                    $json = array(
                        "status" => 404,
                        "comment" => "La tabla o las columnas no existen"
                    );

                    echo json_encode($json, http_response_code($json['status']));

                    return;
                    
                }

                /*================================================
                Soolicitar respuesta del controlador para crear datos en cualquier tabla
                =================================================*/

                $response -> postData($table, $_POST);

                /*================================================
                Peticion Post para usuarios autorizados
                =================================================*/

            }
        }
    }


}



   


    


