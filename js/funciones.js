document.addEventListener('DOMContentLoaded', () => {
    // Cargar comunas cuando la región cambia
    document.getElementById('region').addEventListener('change', cargarComunas);

    // Validar formulario antes de enviar
    document.getElementById('votacionForm').addEventListener('submit', function(event) {
        if (!validarFormulario()) {
            event.preventDefault(); // Evita el envío del formulario si hay errores
        }
    });
});

function cargarComunas() {
    const regionId = document.getElementById('region').value;
    const comunaSelect = document.getElementById('comuna');
    
    // Llamada Ajax para obtener las comunas de la región seleccionada
    if (regionId) {
        fetch(`obtener_comunas.php?region_id=${regionId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Error en la solicitud: ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                comunaSelect.innerHTML = '<option value="">Seleccione una comuna</option>';
                data.forEach(comuna => {
                    const option = document.createElement('option');
                    option.value = comuna.id;
                    option.text = comuna.nombre;
                    comunaSelect.appendChild(option);
                });
            })
            .catch(error => {
                console.error('Error al cargar comunas:', error);
                comunaSelect.innerHTML = '<option value="">No se pudieron cargar las comunas</option>';
            });
    } else {
        comunaSelect.innerHTML = '<option value="">Seleccione una comuna</option>';
    }
}

function formatearRUT(rut) {
    rut = rut.replace(/\s+/g, ''); // Eliminar espacios
    if (rut.length >= 8) {
        return rut.slice(0, -1) + '-' + rut.slice(-1);
    }
    return rut;
}

function validarFormulario() {
    const nombreApellido = document.getElementById('nombre_apellido').value.trim();
    const alias = document.getElementById('alias').value.trim();
    const rut = document.getElementById('rut').value.trim();
    const email = document.getElementById('email').value.trim();
    const region = document.getElementById('region').value;
    const comuna = document.getElementById('comuna').value;
    const candidato = document.getElementById('candidato').value;
    const enterado = document.querySelectorAll('input[name="enterado[]"]:checked');

    if (nombreApellido === '') {
        alert('Nombre y Apellido no puede estar en blanco.');
        return false;
    }

    if (alias.length <= 5 || !/\d/.test(alias) || !/[a-zA-Z]/.test(alias)) {
        alert('Alias debe tener más de 5 caracteres y contener letras y números.');
        return false;
    }

    // Formatear RUT antes de validarlo
    const rutFormateado = formatearRUT(rut);
    document.getElementById('rut').value = rutFormateado;

    if (!validarRUT(rutFormateado)) {
        alert('RUT inválido.');
        return false;
    }

    if (!validarEmail(email)) {
        alert('Email inválido.');
        return false;
    }

    if (!region) {
        alert('Seleccione una región.');
        return false;
    }

    if (!comuna) {
        alert('Seleccione una comuna.');
        return false;
    }

    if (!candidato) {
        alert('Seleccione un candidato.');
        return false;
    }

    if (enterado.length < 2) {
        alert('Seleccione al menos dos opciones en "¿Cómo se enteró de Nosotros?".');
        return false;
    }

    return true;
}

function validarRUT(rut) {
    // Implementar validación completa del RUT si es necesario
    return true; // Placeholder
}

function validarEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}
