CREATE DATABASE DB_Biblioteca;
GO

USE DB_Biblioteca;
GO

CREATE TABLE DIM_TIEMPO (
    id_tiempo INT PRIMARY KEY IDENTITY(1,1),
    fecha DATE NOT NULL UNIQUE,
    dia INT,
    mes INT,
    año INT,
    nombre_mes VARCHAR(20),
    nombre_dia VARCHAR(20),
    trimestre INT,
    semana INT
);

CREATE TABLE DIM_TITULO (
    id_dim_titulo INT PRIMARY KEY IDENTITY(1,1),
    id_titulo INT,
    nombre_titulo VARCHAR(200),
    tema VARCHAR(50),
    año_publicacion INT
);

CREATE TABLE DIM_LECTOR (
    id_dim_lector INT PRIMARY KEY IDENTITY(1,1),
    id_lector INT,
    nombre_lector VARCHAR(200),
    apellido_lector VARCHAR(100),
    tipo_documento VARCHAR(30),
    numero_documento VARCHAR(30),
    estado_membresia VARCHAR(30)
);

CREATE TABLE DIM_TEMA (
    id_dim_tema INT PRIMARY KEY IDENTITY(1,1),
    tema VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE DIM_EDITORIAL (
    id_dim_editorial INT PRIMARY KEY IDENTITY(1,1),
    id_editorial INT,
    nombre_editorial VARCHAR(200),
    ciudad VARCHAR(100),
    pais VARCHAR(100)
);

CREATE TABLE DIM_EJEMPLAR (
    id_dim_ejemplar INT PRIMARY KEY IDENTITY(1,1),
    id_ejemplar INT,
    codigo_ejemplar VARCHAR(20),
    sala VARCHAR(50),
    estante VARCHAR(50),
    estado VARCHAR(30),
    id_edicion INT
);

CREATE TABLE DIM_AUTOR (
    id_dim_autor INT PRIMARY KEY IDENTITY(1,1),
    id_autor INT,
    nombre_autor VARCHAR(100),
    apellido_autor VARCHAR(100),
    fecha_nacimiento DATE,
    ciudad_nacimiento VARCHAR(100),
    pais_nacimiento VARCHAR(100)
);

CREATE TABLE HECHOS_PRESTAMO (
    id_hecho_prestamo INT PRIMARY KEY IDENTITY(1,1),
    id_prestamo INT NOT NULL,
    id_dim_tiempo_prestamo INT,
    id_dim_tiempo_vencimiento INT,
    id_dim_tiempo_devolucion INT,
    id_dim_ejemplar INT,
    id_dim_lector INT,
    id_dim_titulo INT,
    id_dim_tema INT,
    dias_atraso INT,
    fue_devuelto_tiempo BIT,
    cantidad_prestamos INT DEFAULT 1,
    
    medida_dias_atraso INT,
    medida_devuelto_tiempo BIT,
   
    FOREIGN KEY (id_dim_tiempo_prestamo) REFERENCES DIM_TIEMPO(id_tiempo),
    FOREIGN KEY (id_dim_tiempo_vencimiento) REFERENCES DIM_TIEMPO(id_tiempo),
    FOREIGN KEY (id_dim_tiempo_devolucion) REFERENCES DIM_TIEMPO(id_tiempo),
    FOREIGN KEY (id_dim_ejemplar) REFERENCES DIM_EJEMPLAR(id_dim_ejemplar),
    FOREIGN KEY (id_dim_lector) REFERENCES DIM_LECTOR(id_dim_lector),
    FOREIGN KEY (id_dim_titulo) REFERENCES DIM_TITULO(id_dim_titulo),
    FOREIGN KEY (id_dim_tema) REFERENCES DIM_TEMA(id_dim_tema)
);

CREATE TABLE HECHOS_RESERVA (
    id_hecho_reserva INT PRIMARY KEY IDENTITY(1,1),
    id_reserva INT NOT NULL,
    id_dim_tiempo_reserva INT,
    id_dim_tiempo_asignacion INT,
    id_dim_tiempo_recogida INT,
    id_dim_lector INT,
    id_dim_titulo INT,
    id_dim_tema INT,
    id_dim_ejemplar INT,
    estado_reserva VARCHAR(30),
    dias_espera INT,
    fue_ejecutada BIT,
    fue_cancelada BIT,
    fue_expirada BIT,
    cantidad_reservas INT DEFAULT 1,

    FOREIGN KEY (id_dim_tiempo_reserva) REFERENCES DIM_TIEMPO(id_tiempo),
    FOREIGN KEY (id_dim_tiempo_asignacion) REFERENCES DIM_TIEMPO(id_tiempo),
    FOREIGN KEY (id_dim_tiempo_recogida) REFERENCES DIM_TIEMPO(id_tiempo),
    FOREIGN KEY (id_dim_lector) REFERENCES DIM_LECTOR(id_dim_lector),
    FOREIGN KEY (id_dim_titulo) REFERENCES DIM_TITULO(id_dim_titulo),
    FOREIGN KEY (id_dim_tema) REFERENCES DIM_TEMA(id_dim_tema),
    FOREIGN KEY (id_dim_ejemplar) REFERENCES DIM_EJEMPLAR(id_dim_ejemplar)
);

CREATE INDEX idx_hechos_prestamo_tiempo ON HECHOS_PRESTAMO(id_dim_tiempo_prestamo);
CREATE INDEX idx_hechos_prestamo_lector ON HECHOS_PRESTAMO(id_dim_lector);
CREATE INDEX idx_hechos_prestamo_titulo ON HECHOS_PRESTAMO(id_dim_titulo);
CREATE INDEX idx_hechos_prestamo_tema ON HECHOS_PRESTAMO(id_dim_tema);

CREATE INDEX idx_hechos_reserva_tiempo ON HECHOS_RESERVA(id_dim_tiempo_reserva);
CREATE INDEX idx_hechos_reserva_lector ON HECHOS_RESERVA(id_dim_lector);
CREATE INDEX idx_hechos_reserva_titulo ON HECHOS_RESERVA(id_dim_titulo);
CREATE INDEX idx_hechos_reserva_tema ON HECHOS_RESERVA(id_dim_tema);

GO