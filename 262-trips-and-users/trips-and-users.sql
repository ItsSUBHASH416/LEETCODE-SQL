SELECT
    T.REQUEST_AT AS Day,
    ROUND(
        SUM(
            CASE
                WHEN T.STATUS != 'completed'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS 'Cancellation Rate'
FROM Trips T
JOIN Users C
    ON T.CLIENT_ID = C.USERS_ID
JOIN Users D
    ON T.DRIVER_ID = D.USERS_ID
WHERE C.BANNED = 'No'
  AND D.BANNED = 'No'
  AND T.REQUEST_AT BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY T.REQUEST_AT;