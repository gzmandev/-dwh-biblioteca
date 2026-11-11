# Modelo Dimensional de Biblioteca (PA1)

**Curso:** Analítica de Sistemas Empresariales  
**Tecnología:** SQL Server, T-SQL

## Descripción

Modelo de datos dimensional para una biblioteca (esquema estrella). Dimensiones y tablas de hechos para análisis de préstamos y reservas.

## Dimensiones

DIM_TIEMPO, DIM_TITULO, DIM_LECTOR, DIM_TEMA, DIM_EDITORIAL, DIM_EJEMPLAR, DIM_AUTOR.

## Tablas de hechos

HECHOS_PRESTAMO, HECHOS_RESERVA.

## Archivos

| Archivo | Descripción |
|---------|-------------|
| `ModeloDM_GuzmanSoria.sql` | Script SQL: base DB_Biblioteca, tablas, FKs, índices |
| `ModeloER_GuzmanSoria.dm2` | Diagrama ER (binario, herramienta de modelado) |

## Ejecución

1. Abre SQL Server Management Studio.
2. Ejecuta `ModeloDM_GuzmanSoria.sql`.
3. Abre `.dm2` con la herramienta de modelado correspondiente.

## Notas

- `.dm2` es binario; se conserva como referencia visual.
- Sintaxis T-SQL (SQL Server).