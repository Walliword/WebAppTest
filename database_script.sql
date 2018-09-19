DROP DATABASE IF EXISTS test;
CREATE DATABASE test COLLATE utf8_bin;

USE test;

DROP TABLE IF EXISTS part;
CREATE TABLE part(
  id        INT(11)      NOT NULL AUTO_INCREMENT,
  name      VARCHAR(100) NOT NULL,
  required  BIT(1)       NOT NULL DEFAULT FALSE,
  amount    INT(11)      NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

INSERT INTO part (name, required, amount) VALUES
                                                   ('Видеокарта AMD', true, 20),
                                                   ('Процессор AMD', true, 34),
                                                   ('Процессор INTEL', true, 13),
                                                   ('Процессор PENTIUM', false, 14),

                                                   ('Материнская плата ASUS', true, 47),
                                                   ('Звуковая карта GIGABYTE', false, 8),
                                                   ('Подсветка корпуса ASUS', false, 0),
                                                   ('HDD диск ASUS', false, 15),

                                                   ('Корпус ASUS', true, 27),
                                                   ('Память ASUS', true, 13),
                                                   ('SSD диск ASUS', true, 17),
                                                   ('Видеокарта ASUS', false, 3),

                                                   ('Процессор NVIDIA', false, 15),
                                                   ('Материнская плата AMD', false, 25),
                                                   ('Материнская плата Biostar', false, 14),
                                                   ('Материнская плата GIGABYTE', true, 22),

                                                   ('Звуковая карта ASUS', false, 25),
                                                   ('Подсветка корпуса GIGABYTE', false, 0),
                                                   ('HDD диск MSI', true, 3),
                                                   ('Корпус MSI', false, 20),

                                                   ('Память GIGABYTE', false, 13),
                                                   ('SSD диск INTEL', false, 2),
                                                   ('SSD диск MSI', false, 8),
                                                   ('Подсветка корпуса RAZOR', false, 54)
;