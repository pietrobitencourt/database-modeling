-- =====================================================================
-- PROJETO FINAL - MODELAGEM DE BANCO DE DADOS
-- Tema: Delivery de Restaurante
-- Modelo físico (script DDL) - 13 tabelas - MySQL 8

-- Grupo:
-- -> Bernardo Kopp Pinheiro
-- -> Gabriel Valois Rodrigues
-- -> Pedro Henrique Lima dos Santos Mota
-- -> Piêtro Bitencourt Nunes
-- -> Zamorano Fragoso de Sousa

-- LEGENDA RAPIDA (detalhes em cada tabela):
--   DDL ............ Data Definition Language: comandos que DEFINEM a
--                    estrutura (CREATE, ALTER, DROP).
--   PRIMARY KEY .... chave primária: identifica cada linha de forma única.
--   FOREIGN KEY .... chave estrangeira: liga uma coluna à PK de outra
--                    tabela e impede valores que não existem lá.
--   UNIQUE ......... não permite dois valores iguais na coluna.
--   NOT NULL ....... a coluna é obrigatória.
--   DEFAULT ........ valor usado quando nenhum é informado no INSERT.
--   CHECK .......... regra de validação (ex.: preço não pode ser negativo).
-- =====================================================================


-- ---------------------------------------------------------------------
-- DROP DATABASE IF EXISTS:
--   apaga o banco "delivery_restaurante" caso ele já exista. Serve para
--   poder rodar o script várias vezes, sempre recomeçando do zero.
--   (CUIDADO: apaga todos os dados desse banco.)
-- ---------------------------------------------------------------------
DROP DATABASE IF EXISTS delivery_restaurante;

-- ---------------------------------------------------------------------
-- CREATE DATABASE:
--   cria o banco de dados.
--   DEFAULT CHARACTER SET utf8mb4 -> conjunto de caracteres que aceita
--       acentos (ç, ã, é...) e até emojis.
--   DEFAULT COLLATE utf8mb4_unicode_ci -> regra de comparação e ordenação
--       de textos. "ci" = case insensitive (não diferencia maiúscula de
--       minúscula: 'ana' = 'ANA').
-- ---------------------------------------------------------------------
CREATE DATABASE delivery_restaurante
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

-- USE: seleciona o banco em que os próximos comandos serão executados.
USE delivery_restaurante;


-- ---------------------------------------------------------------------
-- CIDADE
-- Guarda as cidades separadas do endereço, para que o registro da cidade
-- não se perca se um endereço for excluído (decisão tomada na modelagem).
-- ---------------------------------------------------------------------
CREATE TABLE cidade (
id_cidade INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
uf CHAR(2) NOT NULL,
PRIMARY KEY (id_cidade),
UNIQUE KEY uq_cidade_nome_uf (nome, uf)
-- UNIQUE KEY composta: o par (nome, uf) não pode se repetir, ou seja,
-- não existem duas vezes "Goiânia/GO". Mas "Goiânia/GO" e "Goiânia/XX" seriam aceitas.
) ENGINE=InnoDB;

-- ENGINE=InnoDB: motor de armazenamento da tabela. O InnoDB é o motor
-- padrão do MySQL e é o que SUPORTA chave estrangeira (FOREIGN KEY),
-- transações (COMMIT/ROLLBACK) e bloqueio por linha. Motores antigos,
-- como o MyISAM, ignoram as chaves estrangeiras. Por isso usamos
-- InnoDB em todas as tabelas.

-- ---------------------------------------------------------------------
-- ENDERECO (N:1 com CIDADE)
-- Endereço reutilizável: serve para clientes, restaurantes e entregas.
-- ---------------------------------------------------------------------
CREATE TABLE endereco (
id_endereco INT NOT NULL AUTO_INCREMENT,
logradouro VARCHAR(150) NOT NULL,
numero VARCHAR(10) NOT NULL,    -- VARCHAR porque pode ter letras (ex.: "12A", "S/N")
complemento VARCHAR(60) NULL,   -- NULL = campo opcional
bairro VARCHAR(80) NOT NULL,
cep CHAR(8) NOT NULL,           -- CEP sem hífen: sempre 8 dígitos
id_cidade INT NOT NULL,          -- FK para cidade
PRIMARY KEY (id_endereco),
CONSTRAINT fk_endereco_cidade
FOREIGN KEY (id_cidade) REFERENCES cidade (id_cidade)
) ENGINE=InnoDB;
-- CONSTRAINT nome: dá um nome à regra, facilitando achar o erro depois.
-- FOREIGN KEY (...) REFERENCES tabela (coluna): só aceita um id_cidade
-- que já exista em cidade. Sem ON DELETE, vale o comportamento padrão
-- (RESTRICT): o MySQL NÃO deixa excluir uma cidade que ainda tem endereços.

-- ---------------------------------------------------------------------
-- CLIENTE
-- ---------------------------------------------------------------------
CREATE TABLE cliente (
id_cliente INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
cpf CHAR(11) NOT NULL,   -- CPF sem pontos e traço: 11 dígitos
telefone VARCHAR(15)  NULL,
email VARCHAR(100) NOT NULL,
-- DATE: guarda somente a data (AAAA-MM-DD).
data_cadastro DATE NOT NULL,
PRIMARY KEY (id_cliente),
-- UNIQUE: impede dois clientes com o mesmo CPF ou o mesmo e-mail.
UNIQUE KEY uq_cliente_cpf (cpf),
UNIQUE KEY uq_cliente_email (email)
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- CLIENTE_ENDERECO
-- Tabela ASSOCIATIVA do relacionamento N:N entre CLIENTE e ENDERECO:
-- um cliente tem vários endereços (casa, trabalho) e um endereço pode
-- ser de vários clientes. O relacionamento ganhou atributos
-- (apelido e principal), por isso virou tabela.
-- ---------------------------------------------------------------------
CREATE TABLE cliente_endereco (
id_cliente INT NOT NULL,
id_endereco INT NOT NULL,
apelido VARCHAR(30) NULL,
principal TINYINT(1) NOT NULL DEFAULT 0,   -- DEFAULT 0: se não informar, assume 0
-- PK COMPOSTA: a combinação (id_cliente, id_endereco) é única, então o
-- mesmo endereço não pode ser vinculado duas vezes ao mesmo cliente.
PRIMARY KEY (id_cliente, id_endereco),
CONSTRAINT fk_ce_cliente
FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
ON DELETE CASCADE,
-- Para o endereço não usamos CASCADE: um endereço também pode estar em
-- uso por restaurantes ou pedidos, então não pode sumir sem cuidado.
CONSTRAINT fk_ce_endereco
FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco)
) ENGINE=InnoDB;
  -- ON DELETE CASCADE: se um cliente for excluído, as linhas dele nesta
  -- tabela são excluídas AUTOMATICAMENTE (em cascata). Faz sentido porque
  -- o vínculo não existe sem o cliente.

-- ---------------------------------------------------------------------
-- RESTAURANTE (N:1 com ENDERECO)
-- ---------------------------------------------------------------------
CREATE TABLE restaurante (
id_restaurante INT NOT NULL AUTO_INCREMENT,
nome_fantasia VARCHAR(100) NOT NULL,
cnpj CHAR(14) NOT NULL,  -- CNPJ sem máscara: 14 dígitos
telefone VARCHAR(15)  NULL,
id_endereco INT NOT NULL,
PRIMARY KEY (id_restaurante),
UNIQUE KEY uq_restaurante_cnpj (cnpj),
CONSTRAINT fk_restaurante_endereco
FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco)
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- CATEGORIA (Pizzas, Bebidas, Sobremesas...)
-- ---------------------------------------------------------------------
CREATE TABLE categoria (
id_categoria INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
PRIMARY KEY (id_categoria),
UNIQUE KEY uq_categoria_nome (nome)
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- PRODUTO (N:1 com CATEGORIA e N:1 com RESTAURANTE)
-- ---------------------------------------------------------------------
CREATE TABLE produto (
id_produto INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
descricao VARCHAR(255) NULL,
preco DECIMAL(10,2) NOT NULL,
estoque INT NOT NULL DEFAULT 0,
ativo TINYINT(1) NOT NULL DEFAULT 1,  -- 1 = ativo no cardápio, 0 = inativo
id_categoria INT NOT NULL,
id_restaurante INT NOT NULL,
PRIMARY KEY (id_produto),
CONSTRAINT ck_produto_preco CHECK (preco >= 0),
CONSTRAINT ck_produto_estoque CHECK (estoque >= 0),
CONSTRAINT fk_produto_categoria
FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
CONSTRAINT fk_produto_restaurante
FOREIGN KEY (id_restaurante) REFERENCES restaurante (id_restaurante)
) ENGINE=InnoDB;
-- DECIMAL(10,2): número com casas decimais EXATAS: até 10 dígitos no
-- total, sendo 2 depois da vírgula (ex.: 12345678.90). É o tipo certo
-- para dinheiro, pois FLOAT/DOUBLE podem gerar erros de arredondamento.
-- CHECK: regra de validação checada a cada INSERT/UPDATE. Aqui o preço
-- e o estoque não podem ficar negativos. (Exige MySQL 8.0.16 ou superior;
-- em versões mais antigas o CHECK é aceito, mas IGNORADO.)

-- ---------------------------------------------------------------------
-- ENTREGADOR
-- ---------------------------------------------------------------------
CREATE TABLE entregador (
id_entregador INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
cpf CHAR(11) NOT NULL,
telefone VARCHAR(15) NULL,
tipo_veiculo VARCHAR(20) NOT NULL,       -- Moto, Bicicleta, Carro
placa VARCHAR(8) NULL,           -- NULL para quem entrega de bicicleta
ativo TINYINT(1) NOT NULL DEFAULT 1,
PRIMARY KEY (id_entregador),
UNIQUE KEY uq_entregador_cpf (cpf)
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- PEDIDO
-- Tabela central do sistema. Liga cliente, restaurante, entregador e
-- o endereço de entrega.
-- ---------------------------------------------------------------------
CREATE TABLE pedido (
id_pedido INT NOT NULL AUTO_INCREMENT,
data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
status ENUM('PENDENTE','PREPARANDO','SAIU_PARA_ENTREGA','ENTREGUE','CANCELADO') NOT NULL DEFAULT 'PENDENTE',
taxa_entrega DECIMAL(10,2) NOT NULL DEFAULT 0.00,
-- valor_total = soma dos itens + taxa de entrega. É um valor DERIVADO
-- guardado de propósito: o trigger da parte de consultas o atualiza.
valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
id_cliente INT NOT NULL,
id_restaurante INT NOT NULL,
-- id_entregador aceita NULL: o pedido só recebe entregador quando sai
-- para entrega (relacionamento opcional, cardinalidade (0,1)).
id_entregador INT NULL,
-- Endereço onde ESTE pedido será entregue (pode ser diferente do
-- endereço principal do cliente).
id_endereco_entrega INT NOT NULL,
PRIMARY KEY (id_pedido),
CONSTRAINT ck_pedido_taxa CHECK (taxa_entrega >= 0),
CONSTRAINT ck_pedido_total CHECK (valor_total >= 0),
CONSTRAINT fk_pedido_cliente
FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
CONSTRAINT fk_pedido_restaurante
FOREIGN KEY (id_restaurante) REFERENCES restaurante (id_restaurante),
CONSTRAINT fk_pedido_entregador
FOREIGN KEY (id_entregador) REFERENCES entregador (id_entregador),
CONSTRAINT fk_pedido_endereco
FOREIGN KEY (id_endereco_entrega) REFERENCES endereco (id_endereco)
) ENGINE=InnoDB;
-- DATETIME: guarda data E hora (AAAA-MM-DD HH:MM:SS).
-- DEFAULT CURRENT_TIMESTAMP: se o INSERT não informar a data/hora, o
-- MySQL grava automaticamente o momento atual do servidor (a função
-- CURRENT_TIMESTAMP é igual a NOW()). Assim o pedido já nasce "datado".
-- ENUM: a coluna só aceita um dos valores da lista. É uma forma de
-- garantir que o status nunca seja escrito errado ("entregue", "ok"...).
-- DEFAULT 'PENDENTE': todo pedido novo começa como pendente.

-- ---------------------------------------------------------------------
-- ITEM_PEDIDO
-- Tabela ASSOCIATIVA do relacionamento N:N entre PEDIDO e PRODUTO:
-- um pedido tem vários produtos e um produto aparece em vários pedidos.
-- preco_unitario guarda o preço NO MOMENTO da compra: se o preço do
-- produto mudar depois, os pedidos antigos continuam com o valor original.
-- ---------------------------------------------------------------------
CREATE TABLE item_pedido (
id_pedido INT NOT NULL,
id_produto INT NOT NULL,
quantidade INT NOT NULL,
preco_unitario DECIMAL(10,2) NOT NULL,
PRIMARY KEY (id_pedido, id_produto), -- PK composta: um produto aparece só uma vez por pedido
CONSTRAINT ck_item_quantidade CHECK (quantidade > 0),
CONSTRAINT ck_item_preco CHECK (preco_unitario >= 0),
-- ON DELETE CASCADE: ao excluir um pedido, os itens dele são excluídos
-- junto (item sem pedido não faz sentido).
CONSTRAINT fk_item_pedido
FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido)
ON DELETE CASCADE,
-- Sem CASCADE em produto: não se pode excluir um produto que já foi vendido.
CONSTRAINT fk_item_produto
FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- FORMA_PAGAMENTO (Pix, Cartão de Crédito, Dinheiro...)
-- ---------------------------------------------------------------------
CREATE TABLE forma_pagamento (
id_forma_pagamento INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(50) NOT NULL,
PRIMARY KEY (id_forma_pagamento),
UNIQUE KEY uq_forma_descricao (descricao)
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- PAGAMENTO (relacionamento 1:1 com PEDIDO)
-- O UNIQUE em id_pedido é o que garante o "1:1": cada pedido tem no
-- máximo um pagamento (sem ele, seria 1:N).
-- ---------------------------------------------------------------------
CREATE TABLE pagamento (
id_pagamento INT NOT NULL AUTO_INCREMENT,
valor DECIMAL(10,2) NOT NULL,
data_pagamento DATE NOT NULL,
status ENUM('PENDENTE','APROVADO','RECUSADO','ESTORNADO') NOT NULL DEFAULT 'PENDENTE',
id_pedido INT NOT NULL,
id_forma_pagamento INT NOT NULL,
PRIMARY KEY (id_pagamento),
UNIQUE KEY uq_pagamento_pedido (id_pedido),
CONSTRAINT ck_pagamento_valor CHECK (valor >= 0),
CONSTRAINT fk_pagamento_pedido
FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
CONSTRAINT fk_pagamento_forma
FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento (id_forma_pagamento)
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- AVALIACAO (relacionamento 1:1 OPCIONAL com PEDIDO)
-- Um pedido tem no máximo uma avaliação (UNIQUE em id_pedido), mas
-- pode não ter nenhuma: a linha só existe se o cliente avaliar.
-- ---------------------------------------------------------------------
CREATE TABLE avaliacao (
id_avaliacao INT NOT NULL AUTO_INCREMENT,
-- TINYINT: inteiro pequeno (-128 a 127), suficiente para notas de 1 a 5.
nota TINYINT NOT NULL,
comentario VARCHAR(255) NULL,
data_avaliacao DATE NOT NULL,
id_pedido INT NOT NULL,
PRIMARY KEY (id_avaliacao),
UNIQUE KEY uq_avaliacao_pedido (id_pedido),
-- CHECK ... BETWEEN 1 AND 5: só aceita notas de 1 a 5.
CONSTRAINT ck_avaliacao_nota CHECK (nota BETWEEN 1 AND 5),
CONSTRAINT fk_avaliacao_pedido
FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido)
) ENGINE=InnoDB;