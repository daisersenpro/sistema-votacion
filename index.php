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

// Obtener regiones
$regiones_sql = "SELECT id, nombre FROM regiones";
$regiones_result = $conn->query($regiones_sql);

// Obtener candidatos
$candidatos_sql = "SELECT id, nombre FROM candidatos";
$candidatos_result = $conn->query($candidatos_sql);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Votación</title>
    <link rel="stylesheet" href="css/estilos.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/funciones.js" defer></script>
</head>
<body>
    <div class="container">
        <h2>Formulario de Votación</h2>
        <form id="votacionForm" action="procesar_voto.php" method="POST">
            <div class="form-group">
                <label for="nombre_apellido">Nombre y Apellido:</label>
                <input type="text" id="nombre_apellido" name="nombre_apellido" placeholder="Ej. Juan Pérez" required>
            </div>
            <div class="form-group">
                <label for="alias">Alias:</label>
                <input type="text" id="alias" name="alias" placeholder="Ej. juanp123" required>
            </div>
            <div class="form-group">
                <label for="rut">RUT:</label>
                <input type="text" id="rut" name="rut" placeholder="Ej. 12345678-9" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Ej. ejemplo@dominio.com" required>
            </div>
            <div class="form-group">
                <label for="region">Región:</label>
                <select id="region" name="region" required>
                    <option value="">Seleccione Región</option>
                    <?php
                    if ($regiones_result->num_rows > 0) {
                        while($row = $regiones_result->fetch_assoc()) {
                            echo "<option value='".$row['id']."'>".$row['nombre']."</option>";
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="comuna">Comuna:</label>
                <select id="comuna" name="comuna" required>
                    <option value="">Seleccione Comuna</option>
                </select>
            </div>
            <div class="form-group">
                <label for="candidato">Candidato:</label>
                <select id="candidato" name="candidato" required>
                    <option value="">Seleccione Candidato</option>
                    <?php
                    if ($candidatos_result->num_rows > 0) {
                        while($row = $candidatos_result->fetch_assoc()) {
                            echo "<option value='".$row['id']."'>".$row['nombre']."</option>";
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label>¿Cómo se enteró de Nosotros?</label>
                <label><input type="checkbox" name="enterado[]" value="Publicidad"> Publicidad</label>
                <label><input type="checkbox" name="enterado[]" value="Redes Sociales"> Redes Sociales</label>
                <label><input type="checkbox" name="enterado[]" value="Recomendación"> Recomendación</label>
                <label><input type="checkbox" name="enterado[]" value="Otros"> Otros</label>
            </div>
            <div class="form-group">
                <button type="submit">Enviar</button>
            </div>
        </form>
    </div>
</body>
</html>

<?php
// Cerrar conexión
$conn->close();
?>
