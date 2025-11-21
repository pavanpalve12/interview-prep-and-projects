SELECT 
  e.user_id
FROM 
  emails e
INNER JOIN 
  texts t 
ON 
  e.email_id = t.email_id
WHERE 
      LOWER (t.signup_action) = 'confirmed' 
  AND DATE (action_date) - DATE (signup_date) = 1
ORDER BY 
  user_id
;