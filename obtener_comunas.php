<?php
// Base de datos credenciales
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "votacion";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Obtener el ID de la región
$region_id = $_GET['region_id'];

// Obtener comunas
$sql = "SELECT id, nombre FROM comunas WHERE region_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $region_id);
$stmt->execute();
$result = $stmt->get_result();

// Crear un array para almacenar las comunas
$comunas = array();
while ($row = $result->fetch_assoc()) {
    $comunas[] = $row;
}

// Devolver los datos en formato JSON
header('Content-Type: application/json');
echo json_encode($comunas);

// Cerrar conexión
$stmt->close();
$conn->close();
?>
