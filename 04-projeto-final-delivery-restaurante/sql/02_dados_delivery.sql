-- =====================================================================
-- DADOS DE EXEMPLO - Delivery de Restaurante (dados fictícios)

-- Grupo:
-- -> Bernardo Kopp Pinheiro
-- -> Gabriel Valois Rodrigues
-- -> Pedro Henrique Lima dos Santos Mota
-- -> Piêtro Bitencourt Nunes
-- -> Zamorano Fragoso de Sousa

-- DML (Data Manipulation Language): comandos que MANIPULAM os dados
-- (INSERT, UPDATE, DELETE). Aqui usamos só INSERT.
--
-- POR QUE ESTA ORDEM? As tabelas "pai" (as que são apontadas por chave
-- estrangeira) precisam receber os dados ANTES das tabelas "filhas".
-- Exemplo: não dá para inserir um endereço com id_cidade = 1 se a cidade
-- 1 ainda não existe. Por isso a ordem é:
--   cidade -> endereco -> cliente -> cliente_endereco -> restaurante ->
--   categoria -> produto -> entregador -> forma_pagamento -> pedido ->
--   item_pedido -> pagamento -> avaliacao

-- Os ids são informados manualmente nos INSERTs para os relacionamentos
-- (FKs) ficarem fáceis de ler e conferir.
-- =====================================================================
USE delivery_restaurante;

-- CIDADE (6): uma em DF e cinco em GO.
INSERT INTO cidade (id_cidade, nome, uf) VALUES
  (1, 'Brasília', 'DF'),
  (2, 'Goiânia', 'GO'),
  (3, 'Anápolis', 'GO'),
  (4, 'Luziânia', 'GO'),
  (5, 'Valparaíso de Goiás', 'GO'),
  (6, 'Águas Lindas de Goiás', 'GO');

-- ENDERECO (21): ids 1 a 4 são dos restaurantes; ids 5 a 21 são de clientes
-- (alguns clientes têm mais de um endereço, ex.: Casa e Trabalho).
INSERT INTO endereco (id_endereco, logradouro, numero, complemento, bairro, cep, id_cidade) VALUES
  (1, 'CLS 308', '12', 'Loja 12', 'Asa Sul', '70747520', 1),
  (2, 'Avenida das Araucárias', '1500', 'Loja 3', 'Águas Claras', '71936250', 1),
  (3, 'QNC 05', '20', NULL, 'Taguatinga', '72110050', 1),
  (4, 'CLN 205', '8', 'Bloco B Loja 8', 'Asa Norte', '70844520', 1),
  (5, 'SQS 114 Bloco C', '302', 'Apto 302', 'Asa Sul', '70377030', 1),
  (6, 'Rua 12 Norte', '45', 'Apto 801', 'Águas Claras', '71909120', 1),
  (7, 'QNM 11', '18', 'Casa', 'Ceilândia', '72215110', 1),
  (8, 'SHCN 705 Bloco A', '204', 'Apto 204', 'Asa Norte', '70730510', 1),
  (9, 'QSC 09', '33', NULL, 'Taguatinga', '72015090', 1),
  (10, 'CRS 504 Bloco A', '103', 'Apto 103', 'Sudoeste', '70350510', 1),
  (11, 'Rua 1', '77', 'Casa', 'Setor Sul', '74093020', 2),
  (12, 'Avenida Brasil', '980', 'Sala 5', 'Centro', '75113050', 3),
  (13, 'Rua das Flores', '15', NULL, 'Jardim Ingá', '72811050', 4),
  (14, 'Quadra 7', '101', 'Casa', 'Parque Esplanada', '72876110', 5),
  (15, 'Rua Bahia', '230', 'Apto 12', 'Setor Oeste', '74125050', 2),
  (16, 'SQN 312 Bloco D', '404', 'Apto 404', 'Asa Norte', '70765040', 1),
  (17, 'QI 17', '09', 'Casa', 'Taguatinga', '72135170', 1),
  (18, 'Rua 8', '60', 'Casa', 'Setor Aeroporto', '74075100', 2),
  (19, 'SQS 205 Bloco F', '101', 'Apto 101', 'Asa Sul', '70235060', 1),
  (20, 'Avenida Castelo Branco', '1200', 'Casa', 'Centro', '72910050', 6),
  (21, 'CSB 04', '16', 'Apto 305', 'Taguatinga', '72015040', 1);

-- CLIENTE (12): os clientes 11 e 12 NÃO têm pedidos, de propósito, para testar
-- consultas com LEFT JOIN / NOT IN (clientes que nunca compraram).
INSERT INTO cliente (id_cliente, nome, cpf, telefone, email, data_cadastro) VALUES
  (1, 'Ana Beatriz Souza', '10000000001', '(61) 99123-0001', 'ana.souza@exemplo.com', '2026-01-15'),
  (2, 'Carlos Eduardo Lima', '10000000002', '(61) 99123-0002', 'carlos.lima@exemplo.com', '2026-02-03'),
  (3, 'Mariana Ferreira', '10000000003', '(61) 99123-0003', 'mariana.ferreira@exemplo.com', '2026-02-20'),
  (4, 'João Pedro Alves', '10000000004', '(61) 99123-0004', 'joao.alves@exemplo.com', '2026-03-08'),
  (5, 'Fernanda Costa', '10000000005', '(62) 99123-0005', 'fernanda.costa@exemplo.com', '2026-03-25'),
  (6, 'Rafael Oliveira', '10000000006', '(62) 99123-0006', 'rafael.oliveira@exemplo.com', '2026-04-12'),
  (7, 'Juliana Mendes', '10000000007', '(61) 99123-0007', 'juliana.mendes@exemplo.com', '2026-05-02'),
  (8, 'Lucas Martins', '10000000008', '(61) 99123-0008', 'lucas.martins@exemplo.com', '2026-05-30'),
  (9, 'Camila Rocha', '10000000009', '(62) 99123-0009', 'camila.rocha@exemplo.com', '2026-06-18'),
  (10, 'Gabriel Santos', '10000000010', '(61) 99123-0010', 'gabriel.santos@exemplo.com', '2026-07-07'),
  (11, 'Patrícia Nogueira', '10000000011', '(61) 99123-0011', 'patricia.nogueira@exemplo.com', '2026-09-01'),
  (12, 'Bruno Carvalho', '10000000012', '(61) 99123-0012', 'bruno.carvalho@exemplo.com', '2026-10-05');

-- CLIENTE_ENDERECO (17): vínculos N:N entre cliente e endereço.
-- principal = 1 marca o endereço principal de cada cliente.
INSERT INTO cliente_endereco (id_cliente, id_endereco, apelido, principal) VALUES
  (1, 5, 'Casa', 1),
  (1, 8, 'Trabalho', 0),
  (2, 6, 'Casa', 1),
  (3, 7, 'Casa', 1),
  (3, 9, 'Trabalho', 0),
  (4, 10, 'Casa', 1),
  (5, 11, 'Casa', 1),
  (5, 15, 'Trabalho', 0),
  (6, 12, 'Casa', 1),
  (7, 13, 'Casa', 1),
  (8, 14, 'Casa', 1),
  (8, 16, 'Trabalho', 0),
  (9, 17, 'Casa', 1),
  (10, 18, 'Casa', 1),
  (11, 19, 'Casa', 1),
  (11, 21, 'Trabalho', 0),
  (12, 20, 'Casa', 1);

-- RESTAURANTE (4): cada um aponta para um dos endereços 1 a 4.
INSERT INTO restaurante (id_restaurante, nome_fantasia, cnpj, telefone, id_endereco) VALUES
  (1, 'Sabor do Cerrado', '11222333000101', '(61) 3321-0001', 1),
  (2, 'Pizzaria Bella Massa', '11222333000202', '(61) 3321-0002', 2),
  (3, 'Burger Station', '11222333000303', '(61) 3321-0003', 3),
  (4, 'Sushi Hana', '11222333000404', '(61) 3321-0004', 4);

-- CATEGORIA (7): compartilhadas entre os restaurantes (ex.: Bebidas).
INSERT INTO categoria (id_categoria, nome) VALUES
  (1, 'Pratos Principais'),
  (2, 'Pizzas'),
  (3, 'Hambúrgueres'),
  (4, 'Culinária Japonesa'),
  (5, 'Acompanhamentos'),
  (6, 'Bebidas'),
  (7, 'Sobremesas');

-- PRODUTO (24): 6 por restaurante. O produto 3 (Feijoada Individual) está
-- INATIVO e sem estoque (ativo = 0, estoque = 0) para testar filtros.
INSERT INTO produto (id_produto, nome, descricao, preco, estoque, ativo, id_categoria, id_restaurante) VALUES
  (1, 'Baião de Dois com Carne de Sol', 'Baião de dois cremoso com carne de sol desfiada', 34.90, 60, 1, 1, 1),
  (2, 'Galinhada com Pequi', 'Arroz com frango caipira e pequi', 32.00, 45, 1, 1, 1),
  (3, 'Feijoada Individual', 'Feijoada completa para uma pessoa', 38.50, 0, 0, 1, 1),
  (4, 'Pamonha Salgada', 'Pamonha de milho com queijo', 12.00, 80, 1, 5, 1),
  (5, 'Suco de Cajá', 'Suco natural de cajá 500 ml', 9.50, 70, 1, 6, 1),
  (6, 'Pudim de Leite', 'Pudim de leite condensado', 11.00, 40, 1, 7, 1),
  (7, 'Pizza Margherita', 'Molho, muçarela, tomate e manjericão', 49.90, 50, 1, 2, 2),
  (8, 'Pizza Calabresa', 'Calabresa fatiada com cebola', 54.90, 50, 1, 2, 2),
  (9, 'Pizza Quatro Queijos', 'Muçarela, provolone, gorgonzola e parmesão', 59.90, 40, 1, 2, 2),
  (10, 'Pizza Frango com Catupiry', 'Frango desfiado com catupiry', 57.90, 35, 1, 2, 2),
  (11, 'Refrigerante 2L', 'Refrigerante sabor cola 2 litros', 14.00, 100, 1, 6, 2),
  (12, 'Petit Gâteau', 'Bolo quente de chocolate com sorvete', 18.90, 30, 1, 7, 2),
  (13, 'X-Burger', 'Hambúrguer, queijo e molho especial', 26.90, 90, 1, 3, 3),
  (14, 'X-Bacon', 'Hambúrguer, queijo e bacon crocante', 31.90, 85, 1, 3, 3),
  (15, 'X-Salada', 'Hambúrguer, queijo, alface e tomate', 24.90, 75, 1, 3, 3),
  (16, 'Batata Frita Grande', 'Porção grande de batata frita', 19.90, 120, 1, 5, 3),
  (17, 'Milkshake de Chocolate', 'Milkshake 400 ml', 17.90, 60, 1, 7, 3),
  (18, 'Refrigerante Lata', 'Refrigerante lata 350 ml', 6.50, 200, 1, 6, 3),
  (19, 'Combo 20 Peças', 'Sushis e sashimis variados', 62.00, 30, 1, 4, 4),
  (20, 'Temaki de Salmão', 'Temaki de salmão com cream cheese', 28.00, 45, 1, 4, 4),
  (21, 'Hot Roll 8 Unidades', 'Hot roll de salmão empanado', 29.90, 40, 1, 4, 4),
  (22, 'Yakisoba de Frango', 'Macarrão oriental com frango e legumes', 36.00, 35, 1, 1, 4),
  (23, 'Chá Gelado', 'Chá gelado de pêssego 500 ml', 8.00, 90, 1, 6, 4),
  (24, 'Mochi Sorvete', 'Mochi recheado com sorvete', 15.00, 25, 1, 7, 4);

-- ENTREGADOR (6): o 4 (Leandro) está inativo e o 6 (Felipe) nunca fez entrega,
-- para testar consultas com LEFT JOIN e COUNT. Quem usa bicicleta não tem placa (NULL).
INSERT INTO entregador (id_entregador, nome, cpf, telefone, tipo_veiculo, placa, ativo) VALUES
  (1, 'Marcos Vinícius Pereira', '20000000001', '(61) 98111-0001', 'Moto', 'PBX1A23', 1),
  (2, 'Diego Ramos', '20000000002', '(61) 98111-0002', 'Moto', 'OVD4F56', 1),
  (3, 'Thiago Barbosa', '20000000003', '(61) 98111-0003', 'Bicicleta', NULL, 1),
  (4, 'Leandro Cunha', '20000000004', '(61) 98111-0004', 'Moto', 'JKL7H89', 0),
  (5, 'Rodrigo Teixeira', '20000000005', '(61) 98111-0005', 'Carro', 'NGB2C34', 1),
  (6, 'Felipe Araújo', '20000000006', '(61) 98111-0006', 'Bicicleta', NULL, 1);

-- FORMA_PAGAMENTO (5).
INSERT INTO forma_pagamento (id_forma_pagamento, descricao) VALUES
  (1, 'Cartão de Crédito'),
  (2, 'Cartão de Débito'),
  (3, 'Pix'),
  (4, 'Dinheiro'),
  (5, 'Vale-Refeição');

-- PEDIDO (33): de agosto a novembro de 2026, com todos os status do ENUM.
-- id_entregador = NULL nos pedidos que ainda não saíram para entrega e nos cancelados.
-- valor_total = soma dos itens + taxa_entrega (já calculado).
INSERT INTO pedido (id_pedido, data_hora, status, taxa_entrega, valor_total, id_cliente, id_restaurante, id_entregador, id_endereco_entrega) VALUES
  (1, '2026-08-01 22:04:00', 'ENTREGUE', 6.00, 39.00, 9, 1, 2, 17),
  (2, '2026-08-03 13:11:00', 'ENTREGUE', 8.00, 351.90, 2, 4, 2, 6),
  (3, '2026-08-15 08:26:00', 'ENTREGUE', 8.00, 95.00, 9, 4, 4, 17),
  (4, '2026-08-16 03:41:00', 'CANCELADO', 8.00, 195.80, 10, 4, NULL, 18),
  (5, '2026-08-17 18:45:00', 'ENTREGUE', 6.00, 205.30, 7, 1, 3, 13),
  (6, '2026-08-19 07:23:00', 'ENTREGUE', 7.50, 225.10, 8, 2, 5, 16),
  (7, '2026-08-20 03:25:00', 'ENTREGUE', 6.00, 17.00, 2, 1, 4, 6),
  (8, '2026-08-21 14:48:00', 'ENTREGUE', 7.50, 251.00, 4, 2, 4, 10),
  (9, '2026-08-23 03:26:00', 'ENTREGUE', 8.00, 60.00, 10, 4, 4, 18),
  (10, '2026-09-08 17:29:00', 'ENTREGUE', 5.00, 72.70, 9, 3, 5, 17),
  (11, '2026-09-11 02:32:00', 'ENTREGUE', 8.00, 168.00, 7, 4, 4, 13),
  (12, '2026-09-14 03:17:00', 'ENTREGUE', 6.00, 75.80, 2, 1, 3, 6),
  (13, '2026-09-16 05:52:00', 'ENTREGUE', 5.00, 116.50, 8, 3, 5, 16),
  (14, '2026-09-22 17:58:00', 'ENTREGUE', 5.00, 174.30, 3, 3, 3, 9),
  (15, '2026-09-27 15:54:00', 'ENTREGUE', 6.00, 120.20, 3, 1, 5, 7),
  (16, '2026-09-28 14:50:00', 'ENTREGUE', 5.00, 94.60, 9, 3, 2, 17),
  (17, '2026-10-02 10:12:00', 'ENTREGUE', 7.50, 177.20, 7, 2, 3, 13),
  (18, '2026-10-03 17:56:00', 'ENTREGUE', 8.00, 83.80, 8, 4, 5, 16),
  (19, '2026-10-05 09:10:00', 'ENTREGUE', 5.00, 78.30, 2, 3, 2, 6),
  (20, '2026-10-08 23:16:00', 'ENTREGUE', 8.00, 140.80, 6, 4, 1, 12),
  (21, '2026-10-12 18:28:00', 'ENTREGUE', 5.00, 81.70, 5, 3, 3, 15),
  (22, '2026-10-17 00:41:00', 'ENTREGUE', 7.50, 95.20, 3, 2, 3, 7),
  (23, '2026-10-20 18:10:00', 'ENTREGUE', 7.50, 86.30, 5, 2, 3, 15),
  (24, '2026-10-22 07:34:00', 'ENTREGUE', 5.00, 31.90, 7, 3, 1, 13),
  (25, '2026-10-29 17:05:00', 'ENTREGUE', 5.00, 128.50, 1, 3, 1, 5),
  (26, '2026-10-29 19:47:00', 'CANCELADO', 8.00, 23.00, 4, 4, NULL, 10),
  (27, '2026-10-31 22:31:00', 'ENTREGUE', 5.00, 98.10, 9, 3, 3, 17),
  (28, '2026-11-02 15:11:00', 'CANCELADO', 7.50, 200.10, 5, 2, NULL, 15),
  (29, '2026-11-02 22:53:00', 'ENTREGUE', 7.50, 117.30, 2, 2, 1, 6),
  (30, '2026-11-10 19:40:00', 'SAIU_PARA_ENTREGA', 5.00, 94.60, 6, 3, 5, 12),
  (31, '2026-11-10 20:05:00', 'PREPARANDO', 8.00, 60.00, 4, 4, NULL, 10),
  (32, '2026-11-11 11:30:00', 'PENDENTE', 8.00, 98.00, 9, 4, NULL, 17),
  (33, '2026-11-11 12:10:00', 'PENDENTE', 8.00, 155.90, 9, 4, NULL, 17);

-- ITEM_PEDIDO (78): itens de cada pedido. preco_unitario é o preço no momento
-- da compra. Todos os itens de um pedido são do restaurante daquele pedido.
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
  (1, 6, 3, 11.00),
  (2, 20, 2, 28.00),
  (2, 19, 3, 62.00),
  (2, 22, 2, 36.00),
  (2, 21, 1, 29.90),
  (3, 22, 1, 36.00),
  (3, 24, 1, 15.00),
  (3, 20, 1, 28.00),
  (3, 23, 1, 8.00),
  (4, 20, 2, 28.00),
  (4, 21, 2, 29.90),
  (4, 22, 2, 36.00),
  (5, 1, 2, 34.90),
  (5, 5, 1, 9.50),
  (5, 4, 2, 12.00),
  (5, 2, 3, 32.00),
  (6, 7, 1, 49.90),
  (6, 8, 2, 54.90),
  (6, 10, 1, 57.90),
  (7, 6, 1, 11.00),
  (8, 12, 1, 18.90),
  (8, 9, 1, 59.90),
  (8, 8, 3, 54.90),
  (9, 22, 1, 36.00),
  (9, 23, 2, 8.00),
  (10, 14, 1, 31.90),
  (10, 17, 2, 17.90),
  (11, 22, 1, 36.00),
  (11, 19, 2, 62.00),
  (12, 1, 2, 34.90),
  (13, 13, 2, 26.90),
  (13, 16, 2, 19.90),
  (13, 17, 1, 17.90),
  (14, 17, 2, 17.90),
  (14, 14, 1, 31.90),
  (14, 13, 1, 26.90),
  (14, 15, 3, 24.90),
  (15, 5, 1, 9.50),
  (15, 1, 3, 34.90),
  (16, 16, 2, 19.90),
  (16, 15, 2, 24.90),
  (17, 9, 1, 59.90),
  (17, 8, 2, 54.90),
  (18, 21, 2, 29.90),
  (18, 23, 2, 8.00),
  (19, 13, 2, 26.90),
  (19, 18, 3, 6.50),
  (20, 20, 1, 28.00),
  (20, 21, 2, 29.90),
  (20, 24, 3, 15.00),
  (21, 13, 1, 26.90),
  (21, 15, 2, 24.90),
  (22, 12, 2, 18.90),
  (22, 7, 1, 49.90),
  (23, 9, 1, 59.90),
  (23, 12, 1, 18.90),
  (24, 13, 1, 26.90),
  (25, 15, 2, 24.90),
  (25, 16, 1, 19.90),
  (25, 13, 2, 26.90),
  (26, 24, 1, 15.00),
  (27, 13, 1, 26.90),
  (27, 16, 3, 19.90),
  (27, 18, 1, 6.50),
  (28, 9, 1, 59.90),
  (28, 11, 1, 14.00),
  (28, 7, 2, 49.90),
  (28, 12, 1, 18.90),
  (29, 8, 2, 54.90),
  (30, 15, 2, 24.90),
  (30, 16, 2, 19.90),
  (31, 20, 1, 28.00),
  (31, 23, 3, 8.00),
  (32, 20, 1, 28.00),
  (32, 19, 1, 62.00),
  (33, 21, 1, 29.90),
  (33, 20, 2, 28.00),
  (33, 19, 1, 62.00);

-- PAGAMENTO (33): um por pedido (relacionamento 1:1). O valor é igual ao
-- valor_total do pedido; o status varia conforme a situação do pedido.
INSERT INTO pagamento (id_pagamento, valor, data_pagamento, status, id_pedido, id_forma_pagamento) VALUES
  (1, 39.00, '2026-08-01', 'APROVADO', 1, 3),
  (2, 351.90, '2026-08-03', 'APROVADO', 2, 5),
  (3, 95.00, '2026-08-15', 'APROVADO', 3, 3),
  (4, 195.80, '2026-08-16', 'RECUSADO', 4, 2),
  (5, 205.30, '2026-08-17', 'APROVADO', 5, 1),
  (6, 225.10, '2026-08-19', 'APROVADO', 6, 4),
  (7, 17.00, '2026-08-20', 'APROVADO', 7, 3),
  (8, 251.00, '2026-08-21', 'APROVADO', 8, 2),
  (9, 60.00, '2026-08-23', 'APROVADO', 9, 1),
  (10, 72.70, '2026-09-08', 'APROVADO', 10, 1),
  (11, 168.00, '2026-09-11', 'APROVADO', 11, 3),
  (12, 75.80, '2026-09-14', 'APROVADO', 12, 1),
  (13, 116.50, '2026-09-16', 'APROVADO', 13, 3),
  (14, 174.30, '2026-09-22', 'APROVADO', 14, 5),
  (15, 120.20, '2026-09-27', 'APROVADO', 15, 3),
  (16, 94.60, '2026-09-28', 'APROVADO', 16, 2),
  (17, 177.20, '2026-10-02', 'APROVADO', 17, 4),
  (18, 83.80, '2026-10-03', 'APROVADO', 18, 3),
  (19, 78.30, '2026-10-05', 'APROVADO', 19, 2),
  (20, 140.80, '2026-10-08', 'APROVADO', 20, 5),
  (21, 81.70, '2026-10-12', 'APROVADO', 21, 2),
  (22, 95.20, '2026-10-17', 'APROVADO', 22, 3),
  (23, 86.30, '2026-10-20', 'APROVADO', 23, 3),
  (24, 31.90, '2026-10-22', 'APROVADO', 24, 4),
  (25, 128.50, '2026-10-29', 'APROVADO', 25, 5),
  (26, 23.00, '2026-10-29', 'RECUSADO', 26, 3),
  (27, 98.10, '2026-10-31', 'APROVADO', 27, 1),
  (28, 200.10, '2026-11-02', 'ESTORNADO', 28, 3),
  (29, 117.30, '2026-11-02', 'APROVADO', 29, 3),
  (30, 94.60, '2026-11-10', 'APROVADO', 30, 1),
  (31, 60.00, '2026-11-10', 'APROVADO', 31, 2),
  (32, 98.00, '2026-11-11', 'PENDENTE', 32, 5),
  (33, 155.90, '2026-11-11', 'PENDENTE', 33, 3);

-- AVALIACAO (19): só alguns pedidos ENTREGUES foram avaliados (relacionamento
-- opcional), com notas de 1 a 5.
INSERT INTO avaliacao (id_avaliacao, nota, comentario, data_avaliacao, id_pedido) VALUES
  (1, 5, 'Chegou rápido e muito saboroso', '2026-08-01', 1),
  (2, 4, 'Comida boa e bem embalada', '2026-08-03', 2),
  (3, 2, 'Demorou demais', '2026-08-18', 5),
  (4, 1, 'Pedido veio errado', '2026-08-19', 6),
  (5, 5, 'Perfeito, recomendo', '2026-08-22', 8),
  (6, 5, 'Tudo excelente', '2026-08-23', 9),
  (7, 5, 'Tudo excelente', '2026-09-09', 10),
  (8, 1, 'Pedido veio errado', '2026-09-11', 11),
  (9, 1, 'Pedido veio errado', '2026-09-16', 13),
  (10, 5, 'Chegou rápido e muito saboroso', '2026-09-27', 15),
  (11, 5, 'Tudo excelente', '2026-09-28', 16),
  (12, 5, 'Tudo excelente', '2026-10-03', 18),
  (13, 5, 'Chegou rápido e muito saboroso', '2026-10-06', 19),
  (14, 2, 'Demorou demais', '2026-10-10', 20),
  (15, 5, 'Chegou rápido e muito saboroso', '2026-10-13', 21),
  (16, 4, 'Gostei bastante', '2026-10-17', 22),
  (17, 4, 'Gostei bastante', '2026-10-23', 24),
  (18, 3, 'Razoável, esperava mais', '2026-10-31', 25),
  (19, 4, 'Muito bom, só demorou um pouco', '2026-11-03', 29);