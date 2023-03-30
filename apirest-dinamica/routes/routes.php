<?php

require_once "models/connection.php";


$routesArray = explode('/', $_SERVER['REQUEST_URI']);
$routesArray = array_filter($routesArray);

/*=============================================
Cuando no se hace ninguna petición a la API
=============================================*/

if (count($routesArray) == 0) {
    $json = array(
        'status' => 404,
        'result' => 'Not found',
    );

    echo json_encode($json, http_response_code($json['status']));

    return;
}
/*=============================================
Cuando si se hace petición a la API
=============================================*/

if(count($routesArray) == 1 && isset($_SERVER['REQUEST_METHOD'])){

    $table = explode('?', $routesArray[1])[0];

    /*=============================================
    Petición GET
    =============================================*/

     if($_SERVER['REQUEST_METHOD'] == 'GET'){
       require 'services/get.php';
    }

     /*=============================================
    Petición POST
    =============================================*/

    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        
        include 'services/post.php';
    }

    /*=============================================
    Petición PUT
    =============================================*/

    if($_SERVER['REQUEST_METHOD'] == 'PUT'){
          
        include 'services/put.php';
    }

    /*=============================================
    Petición DELETE
    =============================================*/

    if($_SERVER['REQUEST_METHOD'] == 'DELETE'){
            
            include 'services/delete.php';
    }

}



