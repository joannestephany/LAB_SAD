
-- TEM QUE CRIAR UMA TB CARGOS E PREENCHER, VLW
select * from TB_CARGO

DECLARE C_NOME CURSOR -- DECLARA O CURSOR/CRIA
	FOR SELECT CARGO FROM TB_CARGO -- ONDE QUE O CURSOR VAI FICAR DESCENDO A LINHA
OPEN C_NOME -- PARA FUNCIONAR TEM QUE ABRIR

	DECLARE @NOMECARGO VARCHAR(50) -- TEM QUE FAZER UMA VARIAVEL PARA RECEBER ATUAL DO CURSOR
	FETCH C_NOME INTO @NOMECARGO -- COLO A O VALOR ATUAL DE CURSOR DENTRO DA VARIAVEL
	PRINT @NOMECARGO -- PRINTEI SO PRA VER EM QUAL ESTA

	FETCH C_NOME INTO @NOMECARGO -- AQUI EU EXECUTEI DNV, ENTAO ELE DESCE
	PRINT @NOMECARGO -- PRINTEI PARA VER EM QUAL EST� E ELE DESCEU 
CLOSE C_NOME  -- NAO PODE ESQUECER DE FECHAR
DEALLOCATE C_NOME -- AQUI � PRA LIMPAR O CURSOR E VOLTAR DO INICIO