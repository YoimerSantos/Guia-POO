
<?php
require "conexion.php";
$objConexion= new mysqli($host,$user,$pasword,$basedatos);
if ($objConexion->connect_error) {
  echo "Error de conexion a la base de datos".$objConexion->connect_error;
  exit();
}

  $sql="update pacientes set pac_fecha_nacimiento=? where pac_identificacion= ?";
 $resultado=$objConexion->prepare($sql);
 $nuevaFecha='1990-06-12';
 $cedula='3212313';
 $result=$resultado->execute();
 if ($result) {
   echo "Actualizacion Completa";
 }
else {
  echo "problemas al actualizar";
}

 ?>
