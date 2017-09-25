<?php
require "conexion.php";
$objConexion= new mysqli($host,$user,$pasword,$basedatos);
if ($objConexion->connect_error) {
  echo "Error de conexion a la base de datos".$objConexion->connect_error;
  exit();
}

  $sql="delete pacientes where pac_identificacion= ?";
 $resultado=$objConexion->prepare($sql);
 $cedula='3212313';
 $resultado-> bind_param('s'$cedula);
 $result=$resultado->execute();
 if ($result) {
   echo "Se elimino de manera correcta";
 }
else {
  echo "problemas al eliminar";
}

 ?>
