<?php
extract($_REQUEST);
require "conexion.php";
$objConexion= new mysqli($host,$user,$pasword,$basedatos);
if ($objConexion->connect_error) {
  echo "Error de conexion a la base de datos".$objConexion->connect_error;
  exit();
}
else {
  echo "Conectados al servidor y listos para usar la base de datos";
}
$sql="insert into pacientes (pac_identificacion,pac_nombre,pac_apellido,pac_fecha_nacimiento,pac_sexo)
values('$_REQUEST[identificacion]','$_REQUEST[nombres]','$_REQUEST[apellidos]','$_REQUEST[fechaNacimiento]','$_REQUEST[sexo]')";

if ($objConexion->query($sql))
  header("location:formulario.php?pag=insertarpaciente&msj=1");

else
    header("location:formulario.php?pag=insertarpaciente&msj=1");


 ?>
