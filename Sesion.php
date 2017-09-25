<?php  session_start();
extract ($_REQUEST);
require "conexion.php";

$pass = md5($_REQUEST ['pass']);
$Login= $_REQUEST['Login'];

$objConexion= Conectarse();
$sql="select * from usuarios where usulogin ='$Login' and usupassword ='$pass'";
$resultado=$objConexion->query($sql);
$existe= $resultado->num_rows;
if ($existe==1){
  $usuario=$resultado->fetch_object();
  $_SESSION['user']=$usuario->usulogin;
  header("location/conexiones/Sesion.php?pag=contenido")
}
else
{
  header("location/conexiones/Sesion.php?pag=iniciarsesion&x=1");
}
?>
