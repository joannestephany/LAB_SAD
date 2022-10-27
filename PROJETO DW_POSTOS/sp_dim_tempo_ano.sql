-- Scripts para povoar o DIMENSÃO TEMPO 
-- povoando por ano
create or alter procedure sp_insert_ANO (@DATA_INICIO DATETIME, @DATA_FIM DATETIME)
as
BEGIN
    DECLARE @id_tempo BIGINT,
			@nivel VARCHAR(8),

			@data DATETIME,
			@ano INT

			SET @DATA = @DATA_INICIO
			
			WHILE @DATA <= @DATA_FIM
			BEGIN

				 SET @ANO = YEAR(@DATA)

				 INSERT INTO DIM_TEMPO(NIVEL,ANO) VALUES('ANO', @ANO)
 
				 SET @DATA = DATEADD(YEAR,1,@DATA)
				 END
END

			SELECT * FROM DIM_TEMPO 
			EXEC sp_insert_ANO '2021-01-01', '2024-01-01'
			SELECT * FROM DIM_TEMPO  -- DEU CERTO POR ANO