/* Desafio 10 Crie uma function chamada de quantidade_musicas_no_historico que exibe a quantidade de
músicas que estão presente atualmente no histórico de reprodução de um usuário ou uma usuária.
Ao receber o código identificador daquele usuário ou daquela usuária, exiba a quantidade de canções em seu histórico de reprodução.
 */

USE SpotifyClone;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE qntd INT;
SELECT
  COUNT(song_id) AS quantidade_musicas_no_historico
FROM
  SpotifyClone.history
WHERE
  user_id = id
INTO qntd;
RETURN qntd;
END $$

DELIMITER ;

SELECT quantidade_musicas_no_historico(18);
