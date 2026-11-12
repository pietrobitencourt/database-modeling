-- =====================================================================
-- PROJETO FINAL - MODELAGEM DE BANCO DE DADOS
-- Tema: Delivery de Restaurante
-- Parte 4: CONSULTAS SQL (6 básicas, 15 intermediárias, 5 avançadas)
--
-- Rode DEPOIS de 01_schema_delivery_comentado.sql e
-- 02_dados_delivery_comentado.sql.
--
-- DQL (Data Query Language): comandos de CONSULTA (SELECT).
-- Cada consulta tem: o que ela responde, o conceito de SQL usado e o
-- comando. No Workbench, selecione UMA consulta por vez e execute
-- (Ctrl+Shift+Enter) para ver o resultado de cada uma no print.
-- =====================================================================
USE delivery_restaurante;


-- =====================================================================
-- 4.1 CONSULTAS BÁSICAS  (SELECT, FROM)
-- =====================================================================

-- B1. Listar todos os dados de todos os clientes.
-- Conceito: SELECT * traz todas as colunas da tabela.
SELECT * FROM cliente;

-- B2. Listar apenas nome, telefone e e-mail dos clientes.
-- Conceito: escolher colunas específicas em vez de usar *.
SELECT nome, telefone, email
FROM cliente;

-- B3. Mostrar o cardápio completo (nome e preço dos produtos).
-- Conceito: apelido de coluna com AS (o título do resultado muda, a tabela não).
SELECT nome AS produto, preco AS preco_reais
FROM produto;

-- B4. Listar os restaurantes cadastrados.
SELECT nome_fantasia, cnpj, telefone
FROM restaurante;

-- B5. Listar os entregadores e seus veículos.
SELECT nome AS entregador, tipo_veiculo, placa
FROM entregador;

-- B6. Listar os pedidos com data, status e valor total.
SELECT id_pedido, data_hora, status, valor_total
FROM pedido;


-- =====================================================================
-- 4.2 CONSULTAS INTERMEDIÁRIAS
-- =====================================================================

-- I1. Quais tipos de veículo os entregadores usam (sem repetição)?
-- Conceito: DISTINCT remove linhas repetidas do resultado.
SELECT DISTINCT tipo_veiculo
FROM entregador;

-- I2. Mostrar o valor total em estoque de cada produto ativo e um preço
--     promocional com 10% de desconto.
-- Conceito: colunas calculadas (*, -, /) e ROUND para arredondar.
SELECT nome,
       preco,
       estoque,
       preco * estoque       AS valor_em_estoque,
       ROUND(preco * 0.90,2) AS preco_promocional
FROM produto
WHERE ativo = 1;

-- I3. Produtos ativos caros (>= 50) OU com estoque baixo (< 30), exceto bebidas.
-- Conceito: WHERE com operadores de comparação (>=, <, =) e lógicos
-- (AND, OR, NOT). Os parênteses definem a ordem de avaliação.
SELECT nome, preco, estoque, id_categoria
FROM produto
WHERE ativo = 1
  AND (preco >= 50 OR estoque < 30)
  AND NOT (id_categoria = 6);

-- I4. Buscar produtos de pizza ou lanches "X-".
-- Conceito: LIKE com curinga % (qualquer sequência de caracteres).
SELECT nome, preco
FROM produto
WHERE nome LIKE '%Pizza%'
   OR nome LIKE 'X-%';

-- I5. Pedidos feitos em outubro de 2026.
-- Conceito: BETWEEN (intervalo com os extremos incluídos).
SELECT id_pedido, data_hora, status, valor_total
FROM pedido
WHERE data_hora BETWEEN '2026-10-01 00:00:00' AND '2026-10-31 23:59:59'
ORDER BY data_hora;

-- I6. Pedidos que ainda estão em andamento.
-- Conceito: IN (compara com uma lista de valores; evita vários OR).
SELECT id_pedido, data_hora, status, valor_total
FROM pedido
WHERE status IN ('PENDENTE','PREPARANDO','SAIU_PARA_ENTREGA');

-- I7. Resumo financeiro dos pedidos entregues: quantidade, faturamento,
--     ticket médio, maior e menor pedido.
-- Conceito: funções de agregação COUNT, SUM, AVG, MAX e MIN.
SELECT COUNT(*)                 AS qtd_pedidos,
       SUM(valor_total)         AS faturamento,
       ROUND(AVG(valor_total),2) AS ticket_medio,
       MAX(valor_total)         AS maior_pedido,
       MIN(valor_total)         AS menor_pedido
FROM pedido
WHERE status = 'ENTREGUE';

-- I8. Pedidos com cliente, restaurante, bairro e cidade de entrega.
-- Conceito: INNER JOIN liga tabelas pela chave estrangeira (FK = PK).
-- Só aparecem linhas que têm correspondência nas tabelas ligadas.
SELECT p.id_pedido,
       c.nome            AS cliente,
       r.nome_fantasia   AS restaurante,
       en.bairro         AS bairro_entrega,
       ci.nome           AS cidade_entrega,
       p.valor_total
FROM pedido p
INNER JOIN cliente      c  ON c.id_cliente      = p.id_cliente
INNER JOIN restaurante  r  ON r.id_restaurante  = p.id_restaurante
INNER JOIN endereco     en ON en.id_endereco    = p.id_endereco_entrega
INNER JOIN cidade       ci ON ci.id_cidade      = en.id_cidade
ORDER BY p.id_pedido;

-- I9. Os 5 produtos mais vendidos (em unidades), desconsiderando cancelados.
-- Conceito: GROUP BY agrupa linhas; SUM soma por grupo; ORDER BY ... DESC
-- ordena do maior para o menor; LIMIT corta o resultado.
SELECT pr.nome AS produto,
       SUM(i.quantidade) AS total_vendido
FROM item_pedido i
INNER JOIN produto pr ON pr.id_produto = i.id_produto
INNER JOIN pedido  p  ON p.id_pedido   = i.id_pedido
WHERE p.status <> 'CANCELADO'
GROUP BY pr.id_produto, pr.nome
ORDER BY total_vendido DESC, produto
LIMIT 5;

-- I10. Restaurantes com faturamento (pedidos entregues) acima de R$ 500.
-- Conceito: HAVING filtra DEPOIS do agrupamento (WHERE filtra antes e
-- não pode usar SUM/COUNT/AVG).
SELECT r.nome_fantasia AS restaurante,
       COUNT(p.id_pedido) AS qtd_pedidos,
       SUM(p.valor_total) AS faturamento
FROM restaurante r
INNER JOIN pedido p ON p.id_restaurante = r.id_restaurante
WHERE p.status = 'ENTREGUE'
GROUP BY r.id_restaurante, r.nome_fantasia
HAVING SUM(p.valor_total) > 500
ORDER BY faturamento DESC;

-- I11. Nota média e quantidade de avaliações de cada restaurante.
-- Conceito: AVG com JOIN de 3 tabelas (avaliacao -> pedido -> restaurante).
SELECT r.nome_fantasia AS restaurante,
       COUNT(a.id_avaliacao)   AS qtd_avaliacoes,
       ROUND(AVG(a.nota),2)    AS nota_media
FROM avaliacao a
INNER JOIN pedido      p ON p.id_pedido      = a.id_pedido
INNER JOIN restaurante r ON r.id_restaurante = p.id_restaurante
GROUP BY r.id_restaurante, r.nome_fantasia
ORDER BY nota_media DESC;

-- I12. Produtos ativos com preço acima da média de preços.
-- Conceito: SUBCONSULTA escalar (retorna um único valor) dentro do WHERE.
SELECT nome, preco
FROM produto
WHERE ativo = 1
  AND preco > (SELECT AVG(preco) FROM produto WHERE ativo = 1)
ORDER BY preco DESC;

-- I13. Clientes que nunca fizeram um pedido.
-- Conceito: SUBCONSULTA com NOT IN (a lista vem de outra consulta).
SELECT id_cliente, nome, data_cadastro
FROM cliente
WHERE id_cliente NOT IN (SELECT id_cliente FROM pedido);

-- I14. Quantidade de entregas concluídas por entregador, incluindo quem
--      nunca entregou.
-- Conceito: LEFT JOIN mantém TODAS as linhas da tabela da esquerda
-- (entregador), mesmo sem correspondência. COUNT(p.id_pedido) ignora
-- NULL, então quem nunca entregou aparece com 0.
SELECT e.nome AS entregador,
       e.tipo_veiculo,
       e.ativo,
       COUNT(p.id_pedido) AS entregas
FROM entregador e
LEFT JOIN pedido p
       ON p.id_entregador = e.id_entregador
      AND p.status = 'ENTREGUE'
GROUP BY e.id_entregador, e.nome, e.tipo_veiculo, e.ativo
ORDER BY entregas DESC;

-- I15. Agenda de contatos: nome e telefone de clientes e entregadores.
-- Conceito: UNION junta os resultados de duas consultas (mesmo número
-- de colunas e tipos compatíveis) e remove duplicados.
SELECT nome, telefone, 'Cliente'    AS tipo FROM cliente
UNION
SELECT nome, telefone, 'Entregador' AS tipo FROM entregador
ORDER BY nome;


-- =====================================================================
-- 4.3 CONSULTAS AVANÇADAS  (TRIGGER e STORED PROCEDURE)
--
-- TRIGGER (gatilho): código que o MySQL executa SOZINHO quando acontece
--   um INSERT, UPDATE ou DELETE em uma tabela (BEFORE = antes, AFTER = depois).
--   Dentro do trigger, NEW.coluna é o valor novo e OLD.coluna é o valor antigo.
-- STORED PROCEDURE (procedimento armazenado): bloco de código salvo no
--   banco, executado quando chamado com CALL, e que pode receber parâmetros.
--
-- DELIMITER: o MySQL usa ";" para terminar um comando, mas dentro de
-- triggers/procedures existem vários ";". Por isso trocamos o delimitador
-- para $$ durante a criação e depois voltamos para ";".
--
-- IMPORTANTE: crie estes objetos DEPOIS de carregar os dados (02_dados...).
-- =====================================================================

DELIMITER $$

-- ---------------------------------------------------------------------
-- A1. TRIGGER BEFORE INSERT em item_pedido: validar o item ANTES de gravar.
-- Regras: o produto precisa estar ativo, ser do restaurante do pedido e
-- ter estoque suficiente. Se alguma regra falhar, SIGNAL cancela o INSERT
-- e mostra uma mensagem de erro (SQLSTATE '45000' = erro definido pelo usuário).
-- ---------------------------------------------------------------------
CREATE TRIGGER trg_item_valida_antes_inserir
BEFORE INSERT ON item_pedido
FOR EACH ROW
BEGIN
  DECLARE v_estoque INT;
  DECLARE v_ativo TINYINT;
  DECLARE v_rest_produto INT;
  DECLARE v_rest_pedido INT;

  SELECT estoque, ativo, id_restaurante
    INTO v_estoque, v_ativo, v_rest_produto
  FROM produto
  WHERE id_produto = NEW.id_produto;

  SELECT id_restaurante INTO v_rest_pedido
  FROM pedido
  WHERE id_pedido = NEW.id_pedido;

  IF v_ativo = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Produto inativo: nao pode ser vendido.';
  END IF;

  IF v_rest_produto <> v_rest_pedido THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O produto nao pertence ao restaurante do pedido.';
  END IF;

  IF v_estoque < NEW.quantidade THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estoque insuficiente para este produto.';
  END IF;
END$$

-- ---------------------------------------------------------------------
-- A2. TRIGGER AFTER INSERT em item_pedido: depois de gravar o item,
-- (1) dá baixa no estoque do produto e (2) recalcula o valor_total do pedido
-- (soma dos itens + taxa de entrega).
-- ---------------------------------------------------------------------
CREATE TRIGGER trg_item_apos_inserir
AFTER INSERT ON item_pedido
FOR EACH ROW
BEGIN
  UPDATE produto
     SET estoque = estoque - NEW.quantidade
   WHERE id_produto = NEW.id_produto;

  UPDATE pedido
     SET valor_total = taxa_entrega +
         (SELECT SUM(quantidade * preco_unitario)
            FROM item_pedido
           WHERE id_pedido = NEW.id_pedido)
   WHERE id_pedido = NEW.id_pedido;
END$$

-- ---------------------------------------------------------------------
-- A3. TRIGGER AFTER UPDATE em pedido: quando o status muda para CANCELADO,
-- devolve ao estoque as quantidades dos itens do pedido.
-- OLD.status <> NEW.status evita devolver duas vezes se o pedido já estava cancelado.
-- ---------------------------------------------------------------------
CREATE TRIGGER trg_pedido_cancelado_devolve_estoque
AFTER UPDATE ON pedido
FOR EACH ROW
BEGIN
  IF NEW.status = 'CANCELADO' AND OLD.status <> 'CANCELADO' THEN
    UPDATE produto pr
    INNER JOIN item_pedido i ON i.id_produto = pr.id_produto
       SET pr.estoque = pr.estoque + i.quantidade
     WHERE i.id_pedido = NEW.id_pedido;
  END IF;
END$$

-- ---------------------------------------------------------------------
-- A4. STORED PROCEDURE sp_adicionar_item: adiciona um produto a um pedido.
-- Busca o preço atual do produto e insere o item usando esse preço.
-- Os triggers A1 e A2 validam e atualizam estoque e total automaticamente.
-- Parâmetros IN: valores recebidos na chamada (CALL).
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_adicionar_item(
  IN p_id_pedido  INT,
  IN p_id_produto INT,
  IN p_quantidade INT
)
BEGIN
  DECLARE v_preco DECIMAL(10,2);

  SELECT preco INTO v_preco
  FROM produto
  WHERE id_produto = p_id_produto;

  IF v_preco IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Produto nao encontrado.';
  END IF;

  INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario)
  VALUES (p_id_pedido, p_id_produto, p_quantidade, v_preco);
END$$

-- ---------------------------------------------------------------------
-- A5. STORED PROCEDURE sp_faturamento_restaurante: relatório de um
-- restaurante em um período (só pedidos ENTREGUES).
-- Retorna: quantidade de pedidos, faturamento e ticket médio.
-- COALESCE troca NULL por 0 quando não há pedidos no período.
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_faturamento_restaurante(
  IN p_id_restaurante INT,
  IN p_data_inicio    DATE,
  IN p_data_fim       DATE
)
BEGIN
  SELECT r.nome_fantasia AS restaurante,
         COUNT(p.id_pedido)                          AS qtd_pedidos,
         COALESCE(SUM(p.valor_total),0)              AS faturamento,
         COALESCE(ROUND(AVG(p.valor_total),2),0)     AS ticket_medio
  FROM restaurante r
  LEFT JOIN pedido p
         ON p.id_restaurante = r.id_restaurante
        AND p.status = 'ENTREGUE'
        AND DATE(p.data_hora) BETWEEN p_data_inicio AND p_data_fim
  WHERE r.id_restaurante = p_id_restaurante
  GROUP BY r.id_restaurante, r.nome_fantasia;
END$$

DELIMITER ;


-- =====================================================================
-- TESTES DAS CONSULTAS AVANÇADAS
-- Cada teste fica dentro de uma TRANSAÇÃO que termina com ROLLBACK:
-- os comandos rodam e mostram o resultado, mas os dados voltam ao que
-- eram antes (nada é gravado de verdade).
-- ---------------------------------------------------------------------

-- Teste A5 (procedure de relatório): faturamento do Sushi Hana (id 4) em outubro.
CALL sp_faturamento_restaurante(4, '2026-10-01', '2026-10-31');

-- Teste A4 + A2 (procedure de item + trigger de estoque e total):
-- adiciona 2 unidades do Yakisoba (produto 22) ao pedido 33 (Sushi Hana).
START TRANSACTION;
  SELECT id_produto, nome, estoque FROM produto WHERE id_produto = 22;      -- antes
  SELECT id_pedido, taxa_entrega, valor_total FROM pedido WHERE id_pedido = 33;  -- antes
  CALL sp_adicionar_item(33, 22, 2);
  SELECT id_produto, nome, estoque FROM produto WHERE id_produto = 22;      -- depois: estoque -2
  SELECT id_pedido, taxa_entrega, valor_total FROM pedido WHERE id_pedido = 33;  -- depois: total + 72,00
ROLLBACK;

-- Teste A3 (cancelamento devolve estoque): cancela o pedido 33 e mostra o estoque dos itens.
START TRANSACTION;
  SELECT i.id_produto, pr.nome, pr.estoque AS estoque_antes
  FROM item_pedido i INNER JOIN produto pr ON pr.id_produto = i.id_produto
  WHERE i.id_pedido = 33;
  UPDATE pedido SET status = 'CANCELADO' WHERE id_pedido = 33;
  SELECT i.id_produto, pr.nome, pr.estoque AS estoque_depois, i.quantidade AS devolvido
  FROM item_pedido i INNER JOIN produto pr ON pr.id_produto = i.id_produto
  WHERE i.id_pedido = 33;
ROLLBACK;

-- Teste A1 (validações): descomente UMA linha por vez para ver cada erro.
-- Obs.: no Workbench, um erro interrompe a execução do script; por isso
-- rode estas linhas isoladas.
-- CALL sp_adicionar_item(33, 3, 1);    -- erro: produto inativo (Feijoada)
-- CALL sp_adicionar_item(33, 7, 1);    -- erro: produto de outro restaurante (pizza em pedido de sushi)
-- CALL sp_adicionar_item(33, 19, 999); -- erro: estoque insuficiente
-- CALL sp_adicionar_item(33, 99, 1);   -- erro: produto nao encontrado
