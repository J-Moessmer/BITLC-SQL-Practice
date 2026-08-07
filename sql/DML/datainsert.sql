USE DMLbeispiel
GO

--neue datensätze anlegen

INSERT INTO kunde
VALUES (1, N'Max', N'Mustermann', '19900404');

-- Das N vor Max und Mustermann ist eine markierung für ein "N"VARCHAR bei zeichen außerhalb dem ASCII bereich
-- im datum kann auch 1990-04-04 funktionieren

INSERT INTO kunde (id, vorname, name)
VALUES (2, N'Mia' , N'Musterfrau')
--verkürzte schreibweise ohne datum



--neue datensätze
INSERT INTO bestellung
VALUES ('20260807', 123.45, 1);


SELECT *
FROM kunde;



--daten updates

UPDATE kunde
SET vorname = 'maximilian'
WHERE vorname = 'Max'

SELECT *
FROM kunde;


UPDATE kunde
SET vorname = 'max'
WHERE vorname = 'maximilian'

SELECT *
FROM kunde;
SELECT *
FROM bestellung;



--löschen
INSERT INTO kunde
VALUES (3, N'Liam', N'löschmichmann', '19900404');

SELECT *
FROM kunde;

DELETE FROM kunde
WHERE id = 3; -- ohne where werden ale daten gelöscht

SELECT *
FROM kunde;