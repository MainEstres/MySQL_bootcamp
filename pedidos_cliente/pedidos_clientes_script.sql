-- CLIENTES --
INSERT INTO cliente(nombre_cliente, direccion, telefono)
VALUES('Nicolas Aguirre', 'San Felipe, Valparaiso', 956981472),
	  ('Camila Silva', 'Putaendo, Valparaiso', 945871236),
      ('Fernando Lopez', 'Los Andes, Valparaiso', 958743494),
      ('Anais Paredes', 'Quilpue, Valparaiso', 957849561),
      ('Pablo Cortez', 'Calle Larga, Valpaiso', 958749216);

-- PEDIDOS --
INSERT INTO pedidos(fecha_pedido, total, id_cliente)
VALUES('2025/09/07', 15248.02, 1),
      ('2025/09/07', 14587.02, 1),
      ('2025/09/06', 25478.05, 2),
      ('2025/09/05', 69457.00, 2),
      ('2025/09/05', 58471.00, 2),
      ('2025/09/05', 25147.00, 3),
      ('2025/09/04', 25669.00, 3),
      ('2025/09/04', 65987.00, 4),
      ('2025/09/04', 26547.00, 4),
      ('2025/09/03', 56984.00, 5),
      ('2025/09/02', 39215.00, 5);

-- TOTAL PEDIDOS --
SELECT c.nombre_cliente, SUM(p.total) AS total_pedidos
FROM cliente c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente;

-- ELIMINAR CLIENTE Y PEDIDO --
DELETE FROM pedidos WHERE id_cliente = 2;
DELETE FROM cliente WHERE id_cliente = 2;

-- MOSTRAR CLIENTES Y PEDIDOS --
SELECT c.id_cliente, c.nombre_cliente, p.id_pedido, p.fecha_pedido, p.total 
FROM cliente c 
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
ORDER BY c.id_cliente;

-- PEDIDOS POR CLIENTE ESPECIFICO --
SELECT * FROM pedidos
WHERE id_cliente LIKE 4;

-- CLIENTE CON MAS PEDIDOS --
SELECT c.id_cliente, c.nombre_cliente, COUNT(p.id_cliente) AS total_pedidos
FROM cliente c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente
ORDER BY total_pedidos DESC
LIMIT 3; 