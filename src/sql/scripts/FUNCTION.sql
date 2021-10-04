-- Função na qual é calculado um desconto de 10% para os produto que tem o valor acima de 20 reais
CREATE FUNCTION FN_DESCONTO
(@N1 NUMERIC(5,2))
RETURNS NUMERIC(5,2)
AS 
BEGIN
    DECLARE @RESULT NUMERIC(5,2)

    IF @N1 > 20
        BEGIN
            SELECT @RESULT = @N1 - (@N1 * 0.1);
        END
    ELSE 
        BEGIN
            SELECT @RESULT = @N1
        END

    RETURN @RESULT
END