SELECT
    ABS(
        MAX(CASE WHEN department = 'marketing' THEN salary ELSE 0 END)
        - MAX(CASE WHEN department = 'engineering' THEN salary ELSE 0 END)
    )
FROM
    db_employee AS e
INNER JOIN
    db_dept AS d
    ON
        e.department_id = d.id
        AND department IN ('marketing', 'engineering');
