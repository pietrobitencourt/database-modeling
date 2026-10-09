/* Nome do sistema: Sistema de Reserva de Carros (ACDN Rental Car)
Fonte: artigo “Modelando um Sistema de Reserva de Carros”, SQL Magazine, edição 74
Disciplina: Modelagem de Banco de Dados
Professora: Josyane Lannes Florenzano De Souza
Estudante: Piêtro Bitencourt Nunes
Tipo de script: apenas DDL (sem inserção de dados)
SGBD: MySQL 
*/

-- 1. CRIAÇÃO DO BANCO DE DADOS
-- IF NOT EXISTS evita erro caso o banco já exista.
CREATE DATABASE IF NOT EXISTS AcdnRentalCar;

-- Seleciona o banco em que as tabelas serão criadas.
USE AcdnRentalCar;

-- 2. CRIAÇÃO DAS TABELAS
-- As tabelas são criadas primeiro, sem FKs. Os relacionamentos são adicionados depois com ALTER TABLE (seção 3), o que dispensa preocupação com a ordem de criação.

-- Representa as sedes da locadora (matriz e filial). multaSede é a taxa cobrada quando o carro é devolvido nesta sede e não é a de origem.
CREATE TABLE sedes (
sedes_id INT UNSIGNED NOT NULL AUTO_INCREMENT,  -- PK gerada automaticamente; UNSIGNED porque id nunca é negativo.
nomeSede VARCHAR(50) NOT NULL,
enderecoSede VARCHAR(80) NOT NULL,
telefoneSede VARCHAR(20) NOT NULL,
nomeGerente VARCHAR(50) NOT NULL,
multaSede DECIMAL(8,2) NOT NULL,  -- DECIMAL porque valores monetários exigem precisão exata (FLOAT é aproximado).
PRIMARY KEY (sedes_id)
);

-- Classes de carro (Subcompacto, Compacto, Médio, Grande, Luxo) e o valor da diária de cada uma.
CREATE TABLE classesCarro (
classesCarro_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
nomeClasse VARCHAR(20) NOT NULL,
valorDiaria DECIMAL(8,2) NOT NULL,  -- DECIMAL porque valores monetários exigem precisão exata (FLOAT é aproximado).
PRIMARY KEY (classesCarro_id)
); 

-- Clientes cadastrados. Inclui dados da CNH, necessários para validar a habilitação na reserva.
CREATE TABLE clientes (
clientes_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
nomeCliente VARCHAR(50) NOT NULL,
cpf VARCHAR(14) NOT NULL UNIQUE,  -- UNIQUE evita cadastrar o mesmo cliente duas vezes; VARCHAR(14) comporta o formato com pontuação.
cnh VARCHAR(20) NOT NULL,
validadeCnh DATE NOT NULL,
categoriaCnh VARCHAR(3) NOT NULL,
PRIMARY KEY (clientes_id)
);

-- Frota da locadora. Cada carro tem sede de origem, localização atual e classe.
CREATE TABLE carros (
carros_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
placa VARCHAR(10) NOT NULL UNIQUE,  -- UNIQUE porque não existem dois veículos com a mesma placa.
modelo VARCHAR(40) NOT NULL,
ano VARCHAR(9) NOT NULL, -- Armazena ano de modelo e fabricação (ex.: “2009/2010”), por isso é texto.
cor VARCHAR(20) NOT NULL,
quilometragem DECIMAL(8,2) NOT NULL,
descricao VARCHAR(100) NOT NULL,
situacaoCarro VARCHAR(30) NOT NULL, -- Valores esperados: “disponível”, “alugado”, “fora do ponto de origem”. 
-- As duas colunas seguintes são FKs para sedes: origem e localização atual são situações distintas.
origemCarro INT UNSIGNED NOT NULL, -- FK para a sede de onde o carro pode ser locado. 
localizacaoCarro INT UNSIGNED,  -- Sem NOT NULL: aceita NULL porque um carro alugado não está em nenhuma sede (multiplicidade 0..1 no modelo). 
classeCarro INT UNSIGNED NOT NULL, -- FK para classesCarro: classe à qual o carro pertence.
PRIMARY KEY (carros_id)
);

-- Locações realizadas. Liga cliente, carro e as sedes de locação e devolução.
CREATE TABLE reservas (
reservas_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
diarias INT NOT NULL,
dataLocacao DATE NOT NULL,
-- As quatro colunas seguintes aceitam NULL porque só são preenchidas na devolução do carro.
dataRetorno DATE,
quilometrosRodados DECIMAL(8,2), 
multaReserva DECIMAL(8,2), 
total DECIMAL(10,2),  -- DECIMAL porque valores monetários exigem precisão exata (FLOAT é aproximado). Aceita NULL: calculado na devolução. 
situacaoReserva VARCHAR(15) NOT NULL,  -- Valores esperados: “ativa”, “atrasada”, “finalizada”. 
carro_reserva INT UNSIGNED NOT NULL, -- FK para carros: carro associado à reserva.
cliente_reserva INT UNSIGNED NOT NULL, -- FK para clientes: cliente que fez a reserva.
sedeLocacao INT UNSIGNED NOT NULL,  -- FK para sedes: sede onde o carro foi retirado.
sedeDevolucao INT UNSIGNED NOT NULL, -- FK para sedes: sede onde o carro será/foi devolvido.
PRIMARY KEY (reservas_id)
);

-- 3. RELACIONAMENTOS (CHAVES ESTRANGEIRAS)
/* Adiciona as chaves estrangeiras que implementam os relacionamentos do modelo lógico. A FK fica na tabela do lado “muitos” e referencia a PK do lado “um”. */

-- Sedes–Carros, “ponto de origem”: cada carro tem uma sede de origem; uma sede é origem de vários carros.
ALTER TABLE carros
ADD CONSTRAINT fk_carros_sedesOrigem 
FOREIGN KEY (origemCarro) REFERENCES sedes(sedes_id);

-- Sedes–Carros, “localização atual”: um carro está em no máximo uma sede por vez (0..1).
ALTER TABLE carros
ADD CONSTRAINT fk_carros_sedesLocAtual 
FOREIGN KEY (localizacaoCarro) REFERENCES sedes(sedes_id);

-- Classes de Carro–Carros, “agrupados em”: cada carro pertence a uma classe.
ALTER TABLE carros
ADD CONSTRAINT fk_carros_classes 
FOREIGN KEY (classeCarro) REFERENCES classesCarro(classesCarro_id);

-- Sedes–Reservas, “sedes de locação”: sede onde a reserva foi feita. 
ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_sedesLocacao 
FOREIGN KEY (sedeLocacao) REFERENCES sedes(sedes_id);

-- Sedes–Reservas, “sedes de devolução”: sede onde o carro foi devolvido. 
ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_sedesDevolucao 
FOREIGN KEY (sedeDevolucao) REFERENCES sedes(sedes_id);

-- Carros–Reservas, “locado em”: cada reserva envolve um carro; um carro pode ter várias reservas ao longo do tempo. 
ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_carros 
FOREIGN KEY (carro_reserva) REFERENCES carros(carros_id);

-- Clientes–Reservas, “fazem”: cada reserva pertence a um cliente; um cliente pode ter várias reservas. 
ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_clientes 
FOREIGN KEY (cliente_reserva) REFERENCES clientes(clientes_id);

-- 4. Validação:
SHOW TABLES;  -- lista as tabelas criadas (esperado: 5). 
DESCRIBE carros;  -- mostra colunas, tipos e se aceitam NULL. 
SHOW CREATE TABLE reservas;  -- mostra o comando de criação completo, incluindo as FKs. 

/* 5. Regras de negócio não implementadas no DDL (ficam a cargo da aplicação):

- Cliente com locação aberta não pode fazer segunda reserva
- Só cliente com CNH válida pode reservar
- Carro alugado ou fora do ponto de origem não pode ser devolvido sem regra de transferência. */
