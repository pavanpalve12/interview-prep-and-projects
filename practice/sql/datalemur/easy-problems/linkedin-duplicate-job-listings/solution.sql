SELECT 
  COUNT (*) AS duplicate_companies
FROM 
(
  SELECT 
    company_id
  , COUNT (job_id) AS post_cnt
  FROM 
    job_listings
  GROUP BY 
    company_id, title, description
  HAVING COUNT (job_id) > 1
) post_grps
;