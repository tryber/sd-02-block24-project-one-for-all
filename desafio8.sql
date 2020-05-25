DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE
ON Users FOR EACH ROW
BEGIN
  DELETE FROM History WHERE user_id = OLD.user_id;
  DELETE FROM UserPlan WHERE user_id = OLD.user_id;
  DELETE FROM Followers WHERE user_id = OLD.user_id;
END$$    

DELIMITER ;

DROP TRIGGER trigger_usuario_delete;
