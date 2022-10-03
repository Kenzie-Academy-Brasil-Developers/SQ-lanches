-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO
	clientes (nome, lealdade)
VALUES
    ('Georgia', 0);


-- 2)
INSERT INTO 
	pedidos (status, cliente_id)
VALUES
    ('Recebido', 6);


-- 3)
INSERT INTO 
	produtos_pedidos (pedido_id, produto_id)
VALUES
    (6, 1),
	(6, 2),
	(6, 6),
	(6, 8),
	(6, 8);


-- Leitura

-- 1)
SELECT 
	c.id,
	c.nome,
	c.lealdade,
	p.id,
	p.status,
	p.cliente_id,
	p2.id,
	p2.nome,
	p2.tipo,
	p2.preço,
	p2.pts_de_lealdade
FROM
	pedidos p 
JOIN
	produtos_pedidos pp ON p.id = pp.pedido_id
JOIN 
	produtos p2 ON p2.id = pp.produto_id
JOIN
	clientes c ON c.id = p.cliente_id 
WHERE
	c.nome ILIKE 'georgia';


-- Atualização

-- 1)
SELECT 
	SUM(p2.pts_de_lealdade)  
FROM
	pedidos p 
JOIN
	produtos_pedidos pp ON p.id = pp.pedido_id
JOIN 
	produtos p2 ON p2.id = pp.produto_id
JOIN
	clientes c ON c.id = p.cliente_id 
WHERE
	c.nome ILIKE 'georgia';

-- 2)
UPDATE 
	clientes c 
SET
	lealdade = 48
WHERE 
	c.nome ILIKE 'georgia';




-- Deleção

-- 1)
DELETE FROM
	clientes C
WHERE 
	c.nome ILIKE 'marcelo'
RETURNING *;

