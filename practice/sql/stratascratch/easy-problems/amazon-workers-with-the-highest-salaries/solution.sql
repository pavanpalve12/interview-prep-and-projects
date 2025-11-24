SELECT worker_title AS best_paid_title
FROM
    (
        SELECT
            *,
            RANK() OVER (ORDER BY salary DESC) AS rank
        FROM
            worker AS w
        INNER JOIN
            title AS t
            ON
                w.worker_id = t.worker_ref_id
        ORDER BY w.salary DESC
    ) AS sal_rank
WHERE
    rank = 1;
