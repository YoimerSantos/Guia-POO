<?php
require "conexion.php";
$objConexion= new mysqli($host,$user,$pasword,$basedatos);
if ($objConexion->connect_error) {
  echo "Error de conexion a la base de datos".$objConexion->connect_error;
  exit();
}

  $sql="update pacientes set pac_fecha_nacimiento='1990-06-12'where pac_identificacion='22867740'";

  $resultado=$objConexion ->query($sql);
  if ($resultado) {
    echo "Informacion Actualizada";
  }
else {
  echo "Error en la actualizacion";
}
$objConexion->close();
