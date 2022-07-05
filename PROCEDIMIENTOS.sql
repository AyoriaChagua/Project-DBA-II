DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE c_notas_cumplidas(IN p_user_id VARCHAR(50))
SELECT COUNT(*) AS cumplidas FROM notes WHERE estado = 'C' AND user_id = p_user_id$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE c_notas_dia(IN p_user_id VARCHAR(50))
SELECT COUNT(*) AS por_dia FROM notes WHERE user_id = p_user_id AND fecha = CURDATE()$$
DELIMITER ;
----
DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE c_notas_incumplidas(IN p_user_id VARCHAR(50))
SELECT COUNT(*) AS incumplidas FROM notes WHERE estado = 'F' AND user_id = p_user_id$$
DELIMITER ;
--
DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE eliminar_dato(IN p_id INT(11))
DELETE FROM notes WHERE id = p_id$$
DELIMITER ;
--
DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE eliminar_por_user(IN p_user_id VARCHAR(50))
DELETE from notes WHERE user_id = p_user_id$$
DELIMITE
---
DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE find_by_id(IN p_id INT(11))
SELECT id, date_format(fecha, "%d-%m-%Y") AS fecha, curso, titulo, estado, user_id, descripcion FROM notes WHERE id = p_id$$
DELIMITER ;
---
DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE insert_datos(IN p_curso VARCHAR(30), IN p_titulo VARCHAR(100), IN p_descripcion TEXT, IN p_user VARCHAR(50))
INSERT INTO notes(curso, titulo, descripcion, user_id)
VALUES(p_curso, p_titulo, p_descripcion, p_user)$$
DELIMITER ;
---
DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE insert_datos(IN p_curso VARCHAR(30), IN p_titulo VARCHAR(100), IN p_descripcion TEXT, IN p_user VARCHAR(50))
INSERT INTO notes(curso, titulo, descripcion, user_id)
VALUES(p_curso, p_titulo, p_descripcion, p_user)$$
DELIMITER ;
---
DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE quitar_datos(IN p_id INT(11))
UPDATE notes set Estado = 'C' WHERE id = p_id$$
DELIMITER ;
----
DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE show_all_datos(IN p_user_id VARCHAR(50))
SELECT id, date_format(fecha, "%d-%m-%Y") AS fecha, curso, titulo, estado, user_id, descripcion FROM notes WHERE user_id = p_user_id ORDER BY estado DESC$$
DELIMITER ;
----
DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE show_datos(IN p_user VARCHAR(50))
SELECT * from notes WHERE estado = "F" AND user_id = p_user  ORDER BY id DESC$$
DELIMITER ;
-----
DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE show_user(IN p_user VARCHAR(50))
SELECT user_id FROM notes WHERE p_user = user_id LIMIT 1$$
DELIMITER ;
----
DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE update_datos(IN p_curso VARCHAR(50), IN p_titulo VARCHAR(50), IN p_descripcion TEXT, IN p_id INT)
UPDATE notes SET curso = p_curso, titulo = p_titulo, descripcion = p_descripcion WHERE id = p_id$$
DELIMITER ;
-----
