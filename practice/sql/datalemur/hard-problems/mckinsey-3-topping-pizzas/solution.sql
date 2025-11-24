-- ------------------------- Optimised Approach ---------------------
WITH top_combination_cte AS 
(
  SELECT 
      *
    ----------- pizza info ---------------
    , CONCAT 
      (
          t1.topping_name
        , ','
        , t2.topping_name
        , ','
        , t3.topping_name
      ) AS pizza
    , t1.ingredient_cost + t2.ingredient_cost + t3.ingredient_cost AS total_cost
  FROM 
    pizza_toppings t1
  CROSS JOIN 
    pizza_toppings t2
  CROSS JOIN 
    pizza_toppings t3
  WHERE 
        t1.topping_name < t2.topping_name
    AND t2.topping_name < t3.topping_name
)
SELECT 
    pizza
  , total_cost
FROM 
  top_combination_cte
ORDER BY 
    total_cost DESC
  , pizza
;


/* ------------------------- Brute Force Approach ---------------------
WITH toppings_cte AS 
(
  SELECT 
    *
    , ROW_NUMBER () OVER (ORDER BY topping_name) AS topping_id
  FROM 
    pizza_toppings
  ORDER BY 
    topping_name
)
,
top_combination_cte AS 
(
  SELECT 
      t1.topping_id AS topping_id_1
    , t2.topping_id AS topping_id_2
    , t3.topping_id AS topping_id_3
    , ROW_NUMBER () 
      OVER 
      (
        ORDER BY t1.topping_id, t2.topping_id, t3.topping_id
      ) AS row_num
  FROM 
    toppings_cte t1
  CROSS JOIN 
    toppings_cte t2
  CROSS JOIN 
    toppings_cte t3
  WHERE 
        t1.topping_id < t2.topping_id
    AND t2.topping_id < t3.topping_id
  ORDER BY 
    t1.topping_id, t2.topping_id, t3.topping_id
)
,
top_combination_cost_cte AS
(
  SELECT 
      t1.row_num
    ---------- toppping 1 info ------------
    , t1.topping_id_1
    , pt1.topping_name AS topping_name_1
    , pt1.ingredient_cost AS ingredient_cost_1
    
    ---------- toppping 2 info ------------
    , t1.topping_id_2
    , pt2.topping_name AS topping_name_2
    , pt2.ingredient_cost AS ingredient_cost_2
    
    ---------- toppping 3 info ------------
    , t1.topping_id_3
    , pt3.topping_name AS topping_name_3
    , pt3.ingredient_cost AS ingredient_cost_3
    
    ------------ pizza info ---------------
    , CONCAT 
      (
          pt1.topping_name
        , ','
        , pt2.topping_name
        , ','
        , pt3.topping_name
      ) AS pizza
    , pt1.ingredient_cost + pt2.ingredient_cost + pt3.ingredient_cost AS total_cost
  FROM 
    top_combination_cte t1
  INNER JOIN 
    toppings_cte pt1
  ON 
    t1.topping_id_1 = pt1.topping_id
  INNER JOIN 
    toppings_cte pt2
  ON 
    t1.topping_id_2 = pt2.topping_id
  INNER JOIN 
    toppings_cte pt3
  ON 
    t1.topping_id_3 = pt3.topping_id  
)
SELECT 
    pizza
  , total_cost
FROM 
  top_combination_cost_cte
ORDER BY 
    total_cost DESC
  , topping_name_1
  , topping_name_2
  , topping_name_3
;
*/