SELECT
    id,
    first_name,
    last_name,
    department_id,
    salary
FROM
    (
        SELECT
            *,
            RANK() OVER (PARTITION BY id ORDER BY salary DESC, department_id ASC) AS rank
        FROM ms_employee_salary
    ) AS sal_rank
WHERE
    rank = 1
ORDER BY
    id;
