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

-- Insercion de Regiones de Prueba
INSERT INTO regiones (nombre) VALUES ('Región Metropolitana'), ('Región de La Araucanía'), ('Región del Biobío');

-- Regiones y Comunas de Prueba
INSERT INTO comunas (nombre, region_id) VALUES 
('Las Condes', 1),
('Vitacura', 1),
('Providencia', 1),
('La Florida', 1),
('Temuco', 2),
('Padre Las Casas', 2),
('Villarrica', 2),
('Concepción', 3),
('Talcahuano', 3),
('Chiguayante', 3);

-- Insercion de Candidatos de Prueba
INSERT INTO candidatos (nombre) VALUES ('Samuel'), ('Anyelo'), ('Francisco'), ('Julio');
