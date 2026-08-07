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

SELECT *
FROM kunde;

--neue datensätze
INSERT INTO bestellung
VALUES ('20260807', 123.45, 1);
