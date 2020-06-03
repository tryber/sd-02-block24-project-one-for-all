/* Desafio 8
Crie uma trigger chamada trigger_usuario_delete que deve ser disparada sempre que um usuário ou uma usuária for excluído(a) do banco de dados. Sua trigger deve executar a seguintes ações abaixo, em ordem:

1 Remover informações sobre este usuário ou esta usuária da tabela que armazena quem ele ou ela estava seguindo;

2 Remover informações sobre este usuário ou esta usuária do histórico de reprodução;

3 Remover informações sobre este usuário ou esta usuária da tabela que mostra a relação do usuário com seu plano.

Teste a funcionalidade correta de sua trigger, fazendo a exclusão da usuária 15.

Sua trigger deve acarretar a exclusão do usuário ou da usuária que for passado(a) em todas as tabelas mencionadas acima.  */

USE SpotifyClone;

DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON users
  FOR EACH ROW
BEGIN
  DELETE FROM plans_purchases
  WHERE user_id = OLD.id;
  DELETE FROM history
  WHERE user_id = OLD.id;
  DELETE FROM followers
  WHERE user_id = OLD.id;
END $$

DELIMITER ;
