-- Scripts para povoar o DIMENSÃO TEMPO

use bd_rede_postos

create or alter procedure sp_insert_data (@DATA_INICIO DATETIME, @DATA_FIM DATETIME)
as
BEGIN
    set nocount on
    DECLARE @id_tempo BIGINT,
			@nivel VARCHAR(8),
			@data DATETIME,
			@dia INT,
			@dia_semana VARCHAR(50),
			@fim_semana VARCHAR(3),
			@mes INT,
			@nome_mes VARCHAR(100),
			@trimestre INT,
			@nome_trimestre VARCHAR(100),
			@semestre INT,
			@nome_semeStre VARCHAR(100),
			@ano INT,

			SET @DATA = @DATA_INICIO

			WHILE @DATA <= @DATA_FIM
			BEGIN
				 
				 SET @DIA = DAY(@DATA)
				 SET @DIA_SEMANA = DATENAME(WEEKDAY,@DATA)

	
				 IF(@DIA_SEMANA = 'SATURDAY' OR @DIA_SEMANA = 'SUNDAY')
					SET @FIM_SEMANA = 'SIM'
				 ELSE
					SET @FIM_SEMANA = 'NAO'


				 SET @MES = MONTH(@DATA)
				 SET @NOME_MES = DATENAME(MONTH,@DATA)
				 SET @TRIMESTRE = DATEPART(QUARTER,@DATA)
				 SET @NOME_TRIMESTRE = DATENAME(QUARTER,@DATA)

				 SELECT @SEMESTRE = CASE
					  WHEN @MES in (1,2,3,4,5,6) THEN 1
					  WHEN @MES in (7,8,9,10,11,12) THEN 2
				 END

				 SELECT @NOME_SEMESTRE = CASE
					  WHEN @MES in (1,2,3,4,5,6) THEN 'PRIMEIRO SEMESTRE'
					  WHEN @MES in (7,8,9,10,11,12) THEN 'SEGUNDO SEMESTRE'
				 END

				 SET @ANO = YEAR(@DATA)

				 INSERT INTO DIM_TEMPO VALUES(@DIA, @DIA_SEMANA, @FIM_SEMANA, @MES, @NOME_MES, @TRIMESTRE, @NOME_TRIMESTRE, @SEMESTRE, @NOME_SEMESTRE)
 
				 SET @DATA = DATEADD(DAY,1,@DATA)
END
	Set nocount OFF

			
			SELECT * DIM_TEMPO
			EXEC sp_insert_data '2021-01-01', '2022-01-01'