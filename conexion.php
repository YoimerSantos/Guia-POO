<?php
//Variables conexion con el servidor y base de datos.
$host="localhost";
$user="root";
$pasword="";
$basedatos="centromedico";

//creamos el objeto conexion utilizando la extension mysli.

$objConexion=new mysqli($host,$user,$pasword,$basedatos);

//Verificamos la conexion.
if ($objConexion->connect_error) {
  echo "Error de conexion a la base de datos".$objConexion->connect_error;
  exit();
}
else {
  echo "Conectados al servidor y listos para usar la base de datos";
}


 ?>
