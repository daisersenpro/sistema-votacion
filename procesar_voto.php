<?php
// Obtener los datos del formulario
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nombreApellido = trim($_POST['nombre_apellido']);
    $alias = trim($_POST['alias']);
    $rut = trim($_POST['rut']);
    $email = trim($_POST['email']);
    $regionId = $_POST['region'];
    $comunaId = $_POST['comuna'];
    $candidatoId = $_POST['candidato'];
    $enteradoWeb = in_array('web', $_POST['enterado']) ? 1 : 0;
    $enteradoTv = in_array('tv', $_POST['enterado']) ? 1 : 0;
    $enteradoRedes = in_array('redes', $_POST['enterado']) ? 1 : 0;
    $enteradoAmigo = in_array('amigo', $_POST['enterado']) ? 1 : 0;

    // Formatear RUT
    $rut = preg_replace('/\D/', '', $rut); // Eliminar caracteres no numéricos
    if (strlen($rut) >= 8) {
        $rut = substr($rut, 0, -1) . '-' . substr($rut, -1);
    }

    // Conectar a la base de datos
    $mysqli = new mysqli('localhost', 'root', '', 'votacion');

    if ($mysqli->connect_error) {
        die('Error de Conexión (' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
    }

    // Verificar si el RUT ya existe
    $stmt = $mysqli->prepare("SELECT id FROM votos WHERE rut = ?");
    $stmt->bind_param("s", $rut);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        echo "Error: El RUT ya ha sido registrado.";
        $stmt->close();
        $mysqli->close();
        exit();
    }

    // Verificar si el correo ya existe
    $stmt = $mysqli->prepare("SELECT id FROM votos WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        echo "Error: El correo electrónico ya ha sido registrado.";
        $stmt->close();
        $mysqli->close();
        exit();
    }

    // Insertar datos
    $stmt = $mysqli->prepare("INSERT INTO votos (nombre_apellido, alias, rut, email, region_id, comuna_id, candidato_id, enterado_web, enterado_tv, enterado_redes, enterado_amigo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    // Asignar valores
    $stmt->bind_param("ssssiiiiiii", $nombreApellido, $alias, $rut, $email, $regionId, $comunaId, $candidatoId, $enteradoWeb, $enteradoTv, $enteradoRedes, $enteradoAmigo);
    
    if ($stmt->execute()) {
        echo "Voto registrado con éxito.";
    } else {
        echo "Error: " . $stmt->error;
    }
    
    // Cerrar la consulta
    $stmt->close();
    $mysqli->close();
}
?>
