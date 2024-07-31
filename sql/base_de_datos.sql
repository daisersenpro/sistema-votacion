-- Crear la base de datos
CREATE DATABASE votacion;

-- Usar la base de datos
USE votacion;

-- Tabla de regiones
CREATE TABLE regiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de comunas
CREATE TABLE comunas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES regiones(id)
);

-- Tabla de Candidatos
CREATE TABLE candidatos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de votos
CREATE TABLE votos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_apellido VARCHAR(100) NOT NULL,
    alias VARCHAR(100) NOT NULL,
    rut VARCHAR(12) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    region_id INT,
    comuna_id INT,
    candidato_id INT,
    enterado_web BOOLEAN,
    enterado_tv BOOLEAN,
    enterado_redes BOOLEAN,
    enterado_amigo BOOLEAN,
    FOREIGN KEY (region_id) REFERENCES regiones(id),
    FOREIGN KEY (comuna_id) REFERENCES comunas(id),
    FOREIGN KEY (candidato_id) REFERENCES candidatos(id)
);

-- Insertar datos en la tabla regiones de Chile con ID 
INSERT INTO regiones (id, nombre) VALUES
(4, 'Arica y Parinacota'),
(5, 'I Región de Tarapacá'),
(6, 'II Región de Antofagasta'),
(7, 'III Región de Atacama'),
(8, 'IV Región de Coquimbo'),
(9, 'V Región de Valparaíso'),
(10, 'VI Región de O’Higgins'),
(11, 'VII Región del Maule'),
(12, 'VIII Región del Biobío'),
(13, 'IX Región de La Araucanía'),
(14, 'X Región de Los Lagos'),
(15, 'XI Región Aysén del General Carlos Ibáñez del Campo'),
(16, 'XII Región de Magallanes y de la Antártica Chilena'),
(17, 'Metropolitana de Santiago'),
(18, 'Los Ríos'),
(19, 'Ñuble');

-- Insertar datos en la tabla comunas
-- Región Arica y Parinacota (id: 4)
INSERT INTO comunas (nombre, region_id) VALUES
('Arica', 4),
('Camarones', 4),
('Putre', 4),
('General Lagos', 4);

-- Región I de Tarapacá (id: 5)
INSERT INTO comunas (nombre, region_id) VALUES
('Iquique', 5),
('Alto Hospicio', 5),
('Pozo Almonte', 5),
('Huara', 5),
('Pica', 5),
('Camiña', 5);

-- Región II de Antofagasta (id: 6)
INSERT INTO comunas (nombre, region_id) VALUES
('Antofagasta', 6),
('Mejillones', 6),
('Sierra Gorda', 6),
('Calama', 6),
('Ollagüe', 6),
('San Pedro de Atacama', 6),
('Tocopilla', 6);

-- Región III de Atacama (id: 7)
INSERT INTO comunas (nombre, region_id) VALUES
('Copiapó', 7),
('Caldera', 7),
('Tierra Amarilla', 7),
('Freirina', 7),
('Huasco', 7),
('Diego de Almagro', 7);

-- Región IV de Coquimbo (id: 8)
INSERT INTO comunas (nombre, region_id) VALUES
('La Serena', 8),
('Coquimbo', 8),
('Andacollo', 8),
('Vicuña', 8),
('Ovalle', 8),
('Combarbalá', 8);

-- Región V de Valparaíso (id: 9)
INSERT INTO comunas (nombre, region_id) VALUES
('Valparaíso', 9),
('Viña del Mar', 9),
('Concón', 9),
('Quilpué', 9),
('Villa Alemana', 9),
('Los Andes', 9);

-- Región VI de O’Higgins (id: 10)
INSERT INTO comunas (nombre, region_id) VALUES
('Rancagua', 10),
('Graneros', 10),
('Machalí', 10),
('San Fernando', 10),
('Santa Cruz', 10),
('Pichilemu', 10);

-- Región VII del Maule (id: 11)
INSERT INTO comunas (nombre, region_id) VALUES
('Talca', 11),
('Curicó', 11),
('Linares', 11),
('Cauquenes', 11),
('Maule', 11),
('San Javier', 11);

-- Región VIII del Biobío (id: 12)
INSERT INTO comunas (nombre, region_id) VALUES
('Concepción', 12),
('Talcahuano', 12),
('Chiguayante', 12),
('Hualpén', 12),
('Los Ángeles', 12),
('San Pedro de la Paz', 12);

-- Región IX de La Araucanía (id: 13)
INSERT INTO comunas (nombre, region_id) VALUES
('Temuco', 13),
('Padre Las Casas', 13),
('Villarrica', 13),
('Pucón', 13),
('Angol', 13),
('Victoria', 13);

-- Región X de Los Lagos (id: 14)
INSERT INTO comunas (nombre, region_id) VALUES
('Osorno', 14),
('Puerto Montt', 14),
('Frutillar', 14),
('Llanquihue', 14),
('Calbuco', 14),
('Puerto Varas', 14);

-- Región XI Aysén del General Carlos Ibáñez del Campo (id: 15)
INSERT INTO comunas (nombre, region_id) VALUES
('Coyhaique', 15),
('Puerto Aysén', 15),
('Chile Chico', 15),
('Cisnes', 15),
('Guaitecas', 15);

-- Región XII de Magallanes y de la Antártica Chilena (id: 16)
INSERT INTO comunas (nombre, region_id) VALUES
('Punta Arenas', 16),
('Puerto Natales', 16),
('Porvenir', 16),
('Cabo de Hornos', 16),
('Antártica', 16);

-- Región Metropolitana de Santiago (id: 17)
INSERT INTO comunas (nombre, region_id) VALUES
('Santiago', 17),
('Puente Alto', 17),
('Maipú', 17),
('La Florida', 17),
('Las Condes', 17),
('Vitacura', 17);

-- Región de Los Ríos (id: 18)
INSERT INTO comunas (nombre, region_id) VALUES
('Valdivia', 18),
('Lanco', 18),
('Ranco', 18),
('Panguipulli', 18);

-- Región de Ñuble (id: 19)
INSERT INTO comunas (nombre, region_id) VALUES
('Chillán', 19),
('Chillán Viejo', 19),
('Pinto', 19),
('San Carlos', 19),
('Yungay', 19);



-- Insercion de Candidatos de Prueba
INSERT INTO candidatos (nombre) VALUES ('Samuel'), ('Anyelo'), ('Francisco'), ('Julio');
