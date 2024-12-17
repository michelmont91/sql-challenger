# DBA Challenge 20240802


## Introdução

Nesse desafio trabalharemos utilizando a base de dados da empresa Bike Stores Inc com o objetivo de obter métricas relevantes para equipe de Marketing e Comercial.

Com isso, teremos que trabalhar com várioas consultas utilizando conceitos como `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `GROUP BY` e `COUNT`.

 
 

## O projeto

- Consultas utilizando a linguagem SQL ANSI;
- Explicação das consultas abaixo.

### Modelo de Dados:

Para entender o modelo, revisar o diagrama a seguir:

![<img src="samples/model.png" height="500" alt="Modelo" title="Modelo"/>](samples/model.png)


## Selects

Construir as seguintes consultas:

Obeservação todas as consultas estão escritas utilizando SQL ANSI.

- Listar todos Clientes que não tenham realizado uma compra;

- Explicação: utlizando LEFT JOIN fazemos a relação de todas as linhas de 
customer com todas as linhas de orders independente de haver ou não 
correspondencia. Quando uma linha de customers não tem relação com nenhuma
linha de orders o campo customer_id é nulo.
    
    ``` 
  SELECT c.* 
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    WHERE o.customer_id IS NULL;

- Listar os Produtos que não tenham sido comprados

- Explicação: utlizando LEFT JOIN fazemos a relação de todas as linhas de
products com todas as linhas de orders_items independente de haver ou não
correspondencia. Quando uma linha de products não tem relação com nenhuma
linha de orders_items o campo order_id é nulo.

  ```
    SELECT p.*
    FROM products p 
    LEFT JOIN order_items o ON p.product_id = o.product_id
    WHERE o.order_id IS NULL;

- Listar os Produtos sem Estoque;
- Explicação: utlizando INNER JOIN fazemos a relação de todas as linhas de
  products com todas as linhas de products em que há correspondecia com linha
- de stoks. Colocamos uma condição para somente retornar quando o stock for zero;
utilizando a clausula WHERE

    ```
    SELECT p.*
    FROM products p
    INNER JOIN stocks s ON s.product_id = p.product_id
    WHERE s.quantity = 0;   
    
- Agrupar a quantidade de vendas que uma determinada Marca por Loja. 
- Explicação: Confome o diagrama precisamos de dados de todas tabelas,citadas na consulta.
- Estamos usando uma agregação agrupando primeiro por loja, depois quantidade vendida.
- Usando join garantimos que seam exibidas apenas as linhas que tenham todas as correspondencias em todas as tabelas.

    ```
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
     
     
- Listar os Funcionarios que não estejam relacionados a um Pedido.
  explicação: utlizando LEFT JOIN fazemos a relação de todas as linhas de
  stafs com todas as linhas de orders independente de haver ou não
  correspondencia. Quando uma linha de stafs não tem relação com nenhuma
  linha de orders o campo staf_id é nulo.
    ```
    Select s.* 
    FROM staffs s
    LEFT JOIN orders o ON s.staff_id = o.staf_id
    WHERE o.staff_id IS NULL
- Como executar, execute o arquivo script.sql em um cliente de banco de dados compativel com SQL como DBeaver ou SQLExplorer apos ter se conectado ao banco.

 


