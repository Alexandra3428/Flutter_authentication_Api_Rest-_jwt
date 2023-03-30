<?php

require_once("models/connection.php");
require_once("controllers/put.controller.php");

if (isset($_GET['id']) && isset($_GET["nameId"])) {
   
    /*=============================================
    Capturamos los datos del formulario
    =============================================*/
    $data = array();
    
    parse_str(file_get_contents('php://input'), $data);

    /*=============================================
    Separar propiedades en el formulario
    =============================================*/
    $columns = array();

    foreach(array_keys($data) as $key => $value){
        
        array_push($columns, $value);
       
    }
    array_push($columns, $_GET['nameId']);

    $columns = array_unique($columns);

    

    /*=============================================
    Validar la tabla y las columnas
    =============================================*/

    if (empty(Connection::getColumnsData($table, $columns))){

        $json = array(
            "status" => 404,
            "comment" => "La tabla o las columnas no existen"
        );

        echo json_encode($json, http_response_code($json['status']));

        return;
        
    }
    


    
}