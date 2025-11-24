WITH advertiser_pay_cte AS
(
  SELECT
      a.user_id
    , a.status
    , d.user_id
    , d.paid
    
    , COALESCE (a.user_id, d.user_id) AS adv_name
    , CASE
        WHEN d.paid IS NULL THEN 'CHURN'
        WHEN d.paid IS NOT NULL AND a.status = 'CHURN' THEN 'RESURRECT'
        WHEN d.paid IS NOT NULL AND a.status IN ('NEW','EXISTING','RESURRECT') THEN 'EXISTING'
        WHEN a.user_id IS NULL AND d.paid IS NOT NULL THEN 'NEW'
        ELSE 'missed_something'
      END AS new_status
  FROM 
    advertiser a
  FULL OUTER JOIN 
    daily_pay d
  ON 
    a.user_id = d.user_id
)
SELECT 
      adv_name AS user_id
    , new_status
FROM
  advertiser_pay_cte
ORDER BY 
  adv_name
;