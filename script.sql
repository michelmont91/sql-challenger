--Consulta 1
SELECT c.*
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    WHERE o.customer_id IS NULL;

--Consulta 2
SELECT p.*
    FROM products p
    LEFT JOIN order_items o ON p.product_id = o.product_id
    WHERE o.order_id IS NULL;
 --Consulta 3
SELECT p.*
FROM products p
INNER JOIN stocks s ON s.product_id = p.product_id
WHERE s.quantity = 0;

 --Consulta 4

SELECT
    s.store_name,
    b.brand_name
    SUM(o.quantity) AS totalt_quantity_sold
    FROM
        orders_items_oi
    JOIN
        products p ON oi.product_id = p.product_id
    JOIN
        brands b ON p.brand_id = b.brand_id
    JOIN
        orders o ON oi.order_id =o.order_id
    JOIN
        stores s ON o.store_id s.store_id
     GROUP BY
        s.store_name, b.brand_name
     ORDER BY
        s.store_name, total_quantity_sold
         DESC;
 --Consulta 5

 Select s.*
     FROM staffs s
     LEFT JOIN orders o ON s.staff_id = o.staf_id
     WHERE o.staff_id IS NULL