-- =====================================================================
-- TRABALHO DML - SISTEMA FÓRMULA 1
-- Modelagem de Dados - Profa MsC Josyane Lannes
-- SGBD: MySQL Workbench
-- Grupo:
-- -> Bernardo Kopp Pinheiro
-- -> Gabriel Valois Rodrigues
-- -> Pedro Henrique Lima dos Santos Mota
-- -> Piêtro Bitencourt Nunes
-- -> Zamorano Fragoso de Sousa
-- =====================================================================

DROP DATABASE IF EXISTS db_formula1;

CREATE DATABASE db_formula1
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE db_formula1;

CREATE TABLE paises (
codigo CHAR(3) NOT NULL,
nome VARCHAR(60) NOT NULL,
PRIMARY KEY (codigo)
);

CREATE TABLE equipes (
sigla CHAR(3) NOT NULL,
nome VARCHAR(60) NOT NULL,
cod_pais CHAR(3) NOT NULL,
PRIMARY KEY (sigla),
FOREIGN KEY (cod_pais) REFERENCES paises (codigo)
);

CREATE TABLE pilotos (
numero INT NOT NULL,
nome VARCHAR(80) NOT NULL,
cod_pais CHAR(3) NOT NULL,
sigla_equipe CHAR(3) NOT NULL,
PRIMARY KEY (numero),
FOREIGN KEY (cod_pais) REFERENCES paises (codigo),
FOREIGN KEY (sigla_equipe) REFERENCES equipes (sigla)
);

CREATE TABLE corridas (
sigla_gp CHAR(3) NOT NULL,
nome_gp VARCHAR(80) NOT NULL,
cod_pais CHAR(3) NOT NULL,
qtd_voltas INT NOT NULL,
PRIMARY KEY (sigla_gp),
FOREIGN KEY (cod_pais) REFERENCES paises (codigo)
);
 
CREATE TABLE participantes (
sigla_gp CHAR(3) NOT NULL,
num_piloto INT NOT NULL,
posicao_largada INT NOT NULL,
PRIMARY KEY (sigla_gp, num_piloto),
FOREIGN KEY (sigla_gp) REFERENCES corridas (sigla_gp),
FOREIGN KEY (num_piloto) REFERENCES pilotos (numero)
);

INSERT INTO paises (codigo, nome) VALUES
('BRA', 'Brasil'), ('ITA', 'Itália'), ('FRA', 'França'), ('DEU', 'Alemanha'), ('GBR', 'Reino Unido'), ('NLD', 'Países Baixos'),
('MCO', 'Mônaco'), ('JPN', 'Japão'), ('AUS', 'Austrália'), ('BEL', 'Bélgica'), ('ESP', 'Espanha'),
('AUT', 'Áustria'), ('BHR', 'Bahrein'), ('HUN', 'Hungria'), ('CHE', 'Suíça'), ('USA', 'Estados Unidos');

INSERT INTO equipes (sigla, nome, cod_pais) VALUES
('MCL', 'McLaren', 'GBR'), ('FER', 'Ferrari', 'ITA'), ('MER', 'Mercedes', 'DEU'), ('RBR', 'Red Bull Racing', 'AUT'),
('WIL', 'Williams', 'GBR'), ('REN', 'Renault', 'FRA'), ('ALP', 'Alpine', 'FRA'), ('BRB', 'Brabham', 'GBR'), ('LOT', 'Lotus', 'GBR'),
('SAU', 'Sauber', 'CHE'), ('BEN', 'Benetton', 'ITA'), ('RBS', 'Racing Bulls', 'ITA');

INSERT INTO pilotos (numero, nome, cod_pais, sigla_equipe) VALUES
(1,  'Ayrton Senna', 'BRA', 'MCL'),
(2,  'Nelson Piquet', 'BRA', 'BRB'),
(3,  'Emerson Fittipaldi', 'BRA', 'LOT'),
(4,  'Rubens Barrichello', 'BRA', 'FER'),
(5,  'Felipe Massa', 'BRA', 'FER'),
(6,  'Gabriel Bortoleto', 'BRA', 'SAU'),
(7,  'Kimi Antonelli', 'ITA', 'MER'),
(8,  'Giancarlo Fisichella', 'ITA', 'REN'),
(9,  'Alessandro Nannini', 'ITA', 'BEN'),
(10, 'Alain Prost', 'FRA', 'WIL'),
(11, 'Pierre Gasly', 'FRA', 'ALP'),
(12, 'Esteban Ocon', 'FRA', 'ALP'),
(13, 'Isack Hadjar', 'FRA', 'RBS'),
(14, 'Max Verstappen', 'NLD', 'RBR'),
(15, 'Lewis Hamilton', 'GBR', 'MER');

INSERT INTO corridas (sigla_gp, nome_gp, cod_pais, qtd_voltas) VALUES
('INT', 'GP de São Paulo (Interlagos)', 'BRA', 71),
('MNZ', 'GP da Itália (Monza)', 'ITA', 53),
('MON', 'GP de Mônaco', 'MCO', 78),
('SIL', 'GP da Grã-Bretanha (Silverstone)', 'GBR', 52),
('SPA', 'GP da Bélgica (Spa-Francorchamps)', 'BEL', 44),
('SUZ', 'GP do Japão (Suzuka)', 'JPN', 53),
('AUS', 'GP da Austrália (Melbourne)', 'AUS', 58),
('AUT', 'GP da Áustria (Red Bull Ring)', 'AUT', 71),
('ESP', 'GP da Espanha (Barcelona)', 'ESP', 66),
('BHR', 'GP do Bahrein (Sakhir)', 'BHR', 57),
('HUN', 'GP da Hungria (Hungaroring)', 'HUN', 70);

INSERT INTO participantes (sigla_gp, num_piloto, posicao_largada) VALUES
('INT', 14, 1), ('INT', 15, 2), ('INT', 1, 3),  ('INT', 6, 4),  ('INT', 5, 5),
('INT', 4, 6),  ('INT', 7, 7),  ('INT', 11, 8), ('INT', 12, 9), ('INT', 10, 10),
('MON', 15, 1), ('MON', 14, 2), ('MON', 7, 3),  ('MON', 1, 4),  ('MON', 2, 5),
('MON', 11, 6), ('MON', 13, 7), ('MON', 5, 8),
('MNZ', 7, 1),  ('MNZ', 14, 2), ('MNZ', 15, 3), ('MNZ', 8, 4),  ('MNZ', 9, 5),
('MNZ', 4, 6),  ('MNZ', 3, 7),  ('MNZ', 12, 8),
('SIL', 14, 1), ('SIL', 15, 2), ('SIL', 1, 3),  ('SIL', 10, 4), ('SIL', 6, 5),
('SIL', 7, 6),  ('SIL', 13, 7), ('SIL', 2, 8),
('SPA', 1, 1),  ('SPA', 10, 2), ('SPA', 2, 3),  ('SPA', 14, 4), ('SPA', 15, 5),
('SPA', 11, 6);


-- ==========
--  Queries
-- ==========

-- 01) Insira no mínimo 5 pilotos do Brasil, 3 da Itália e 2 da França.
SELECT p.nome AS pais, COUNT(*) AS qtd_pilotos
FROM pilotos pi JOIN paises p 
ON p.codigo = pi.cod_pais
WHERE p.nome IN ('Brasil', 'Itália', 'França') GROUP BY p.nome;
 
-- 02) Popule todas as tabelas:
SELECT 'paises' AS tabela, COUNT(*) AS registros FROM paises
UNION ALL SELECT 'equipes', COUNT(*) FROM equipes
UNION ALL SELECT 'pilotos', COUNT(*) FROM pilotos
UNION ALL SELECT 'corridas', COUNT(*) FROM corridas
UNION ALL SELECT 'participantes', COUNT(*) FROM participantes;
 
-- 03) Países que começam com B e terminam com L:
SELECT nome
FROM paises
WHERE nome LIKE 'B%L';
 
-- 04) Pilotos dos países BRASIL, ITÁLIA e FRANÇA:
SELECT pi.nome
FROM pilotos pi
WHERE pi.cod_pais IN (SELECT codigo FROM paises WHERE nome IN ('Brasil', 'Itália', 'França'));
 
-- 05) Nome dos pilotos:
SELECT nome
FROM pilotos;
 
-- 06) Nome dos GPs e quantidade de voltas (com ALIAS):
SELECT nome_gp AS grande_premio,
qtd_voltas AS quantidade_de_voltas
FROM corridas;
 
-- 07) Nome dos pilotos e seus países:
SELECT pi.nome AS piloto, p.nome  AS pais
FROM pilotos pi JOIN paises p 
ON p.codigo = pi.cod_pais;
 
-- 08) Inserir o atributo salário na tabela piloto:
ALTER TABLE pilotos
ADD COLUMN salario DECIMAL(10,2);
 
-- 09) Popular o atributo salário da tabela piloto:
UPDATE pilotos SET salario = 95000.00  WHERE numero = 1;   -- Ayrton Senna
UPDATE pilotos SET salario = 88000.00  WHERE numero = 2;   -- Nelson Piquet
UPDATE pilotos SET salario = 72000.00  WHERE numero = 3;   -- Emerson Fittipaldi
UPDATE pilotos SET salario = 80000.00  WHERE numero = 4;   -- Rubens Barrichello
UPDATE pilotos SET salario = 78000.00  WHERE numero = 5;   -- Felipe Massa
UPDATE pilotos SET salario = 65000.00  WHERE numero = 6;   -- Gabriel Bortoleto
UPDATE pilotos SET salario = 90000.00  WHERE numero = 7;   -- Kimi Antonelli
UPDATE pilotos SET salario = 70000.00  WHERE numero = 8;   -- Giancarlo Fisichella
UPDATE pilotos SET salario = 60000.00  WHERE numero = 9;   -- Alessandro Nannini
UPDATE pilotos SET salario = 100000.00 WHERE numero = 10;  -- Alain Prost
UPDATE pilotos SET salario = 85000.00  WHERE numero = 11;  -- Pierre Gasly
UPDATE pilotos SET salario = 80000.00  WHERE numero = 12;  -- Esteban Ocon
UPDATE pilotos SET salario = 55000.00  WHERE numero = 13;  -- Isack Hadjar
UPDATE pilotos SET salario = 120000.00 WHERE numero = 14;  -- Max Verstappen
UPDATE pilotos SET salario = 115000.00 WHERE numero = 15;  -- Lewis Hamilton

SELECT numero, nome, salario FROM pilotos;
 
-- 10) Pilotos com salários entre 70 e 100 mil:
SELECT nome, salario
FROM pilotos
WHERE salario BETWEEN 70000 AND 100000;
 
-- 11) Para cada cod_pais, a média salarial dos pilotos:
SELECT cod_pais, AVG(salario) AS media_salarial
FROM pilotos
GROUP BY cod_pais;
 
-- 12) Valores diferentes de salário, em ordem crescente:
SELECT DISTINCT salario
FROM pilotos
ORDER BY salario ASC;