-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
--1.Consulte por todos os pedidos juntamente com todas as informações dos produtos que estão em cada um dos pedidos.

SELECT 
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
	produtos p2 ON p2.id = pp.produto_id;

-- 2)
--2.Consulte pelo ID de todos os pedidos que incluam 'Fritas'.

SELECT 
	p.id
FROM
	pedidos p 
JOIN
	produtos_pedidos pp ON p.id = pp.pedido_id
JOIN 
	produtos p2 ON p2.id = pp.produto_id
WHERE
	p2.nome ILIKE 'fritas';

-- 3)
--3.Consulte novamente por pedidos que incluam 'Fritas', porém agora, retorne apenas uma coluna (gostam_de_fritas) com o nome dos Clientes que fizeram os pedidos.

SELECT 
	c.nome AS gostam_de_fritas
FROM
	pedidos p 
JOIN
	produtos_pedidos pp ON p.id = pp.pedido_id
JOIN 
	produtos p2 ON p2.id = pp.produto_id
JOIN
	clientes c ON c.id = p.cliente_id 
WHERE
	p2.nome ILIKE 'fritas';

-- 4)
--4.Crie uma query que retorne o custo total dos pedidos da 'Laura'.

SELECT 
	SUM(p2.preço)  
FROM
	pedidos p 
JOIN
	produtos_pedidos pp ON p.id = pp.pedido_id
JOIN 
	produtos p2 ON p2.id = pp.produto_id
JOIN
	clientes c ON c.id = p.cliente_id 
WHERE
	c.nome ILIKE 'laura';

-- 5)
--5.Crie uma query que retorne em uma coluna o nome do produto, e na outra, o número de vezes que ele foi pedido. Dica: a função built-in COUNT pode somar o número de ocorrências de um id em uma coluna.

SELECT 
	p2.nome,
	count(pp.produto_id) AS contagem 
FROM
	pedidos p 
JOIN
	produtos_pedidos pp ON p.id = pp.pedido_id
JOIN 
	produtos p2 ON p2.id = pp.produto_id
JOIN
	clientes c ON c.id = p.cliente_id
GROUP BY p2.nome;
