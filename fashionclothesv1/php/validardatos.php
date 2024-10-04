<?php 
include "conexion.php";

$usuario = $_POST['usuario'];
$pass = $_POST['pass'];

$consulta = mysqli_prepare($conexion, "SELECT * FROM cliente WHERE usuario = ? AND pass = ?");
mysqli_stmt_bind_param($consulta, "ss", $usuario, $pass);
mysqli_stmt_execute($consulta);
$resultado = mysqli_stmt_get_result($consulta);

if ($resultado && mysqli_num_rows($resultado) > 0) {
    $fila = mysqli_fetch_assoc($resultado);
    $id_usuario = $fila['idcliente'];
    $usuario = $fila['usuario'];
    $pass = $fila['pass'];
    $tipo = $fila['tipo'];
    
    session_start();
    $_SESSION['usuario'] = $usuario;
    $_SESSION['pass'] = $pass;
    $_SESSION['tipo'] = $tipo;
    $_SESSION['time'] = time();

    

    
    if ($tipo === "user") {
        header('Location: userpag.php');
    }
} else {
    echo '<script> 
    alert("problemas de autenticacion");
 </script>';
 header('Location: http://localhost/fashionclothes/');
}
?>