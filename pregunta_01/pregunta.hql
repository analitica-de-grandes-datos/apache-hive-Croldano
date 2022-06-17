/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/
DROP TABLE IF EXISTS t1;

CREATE TABLE t1 (letter STRING,
                 fecha DATE,
                 number int)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE t1 ;

INSERT OVERWRITE local directory 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT letter,count(*) FROM t1 GROUP BY letter;