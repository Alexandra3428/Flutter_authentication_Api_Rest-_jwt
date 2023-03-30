<?php
require_once("models/connection.php");
require_once("get.model.php");
class DeleteModel{

    /*=============================================
    Petición delete para eliminar datos de forma dinamica
    =============================================*/

    static public function deleteData($table, $id, $nameId){
        echo '<pre>'; print_r($nameId); echo '</pre>';
        echo '<pre>'; print_r($id); echo '</pre>';
        echo '<pre>'; print_r($table); echo '</pre>';

        
       
        $sql = "UPDATE FROM $table WHERE $nameId = :$nameId";

        $link = Connection::connect();
        $stmt = $link->prepare($sql);

        $stmt -> bindParam(":".$nameId, $id, PDO::PARAM_STR);

        if($stmt -> execute()){
            $response = array(
                "status" => "success",
                "code" => 200,
                "message" => "Datos actualizados correctamente"
            );

              return $response;
        }else{
            return $link->errorInfo();
        }      
       
    }
}