<?php
require "conexion.php";
$objConexion= new mysqli($host,$user,$pasword,$basedatos);
if ($objConexion->connect_error) {
  echo "Error de conexion a la base de datos".$objConexion->connect_error;
  exit();
}

  $sql= "select * from pacientes";
  $resultado= $objConexion->query($sql);

 ?>
 <!DOCTYPE html>
 <html>
   <head>
     <meta charset="utf-8">
     <title>Tabla Pacientes</title>
   </head>
   <body>
     <h1 align= "center"> Listado de Pacientes</h1>
     <table width="70%" border="1" align="center">
       <tr align="center" bgcolor="#4DD0E1">
         <td><b>Identificacion</b></td>
         <td><b>Nombres</b></td>
         <td><b>Apellidos</b></td>
         <td><b>Fecha de nacimiento</b></td>
         <td><b>Sexo</b></td>

       </tr>
       <?php
        while ($datos=$resultado->fetch_array()) {
        ?>
        <tr>
          <td><?php echo $datos['pac_identificacion']  ?></td>
          <td><?php echo $datos['pac_nombre']  ?></td>
          <td><?php echo $datos['pac_apellido'] ?></td>
          <td><?php echo $datos['pac_fecha_nacimiento'] ?></td>
          <td><?php echo $datos['pac_sexo'] ?></td>
        </tr>
      <?php
      }
     ?>

     </table>
   </body>
 </html>
