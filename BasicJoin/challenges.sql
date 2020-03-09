SELECT Challenges.hacker_id, Hackers.name, COUNT(Challenges.hacker_id) AS challenges_created
FROM Hackers INNER JOIN Challenges ON Hackers.hacker_id = Challenges.hacker_id
GROUP BY Challenges.hacker_id, Hackers.name
HAVING
    challenges_created = (
        SELECT MAX(challenges1.hackers1)
        FROM (
            SELECT COUNT(hacker_id) as hackers1
            FROM Challenges
            GROUP BY hacker_id
            ORDER BY hacker_id
        ) challenges1
    )
    OR challenges_created IN (
        SELECT challenges2.hackers2
        FROM (
            SELECT COUNT(*) AS hackers2
            FROM Challenges
            GROUP BY hacker_id
        ) challenges2
        GROUP BY challenges2.hackers2
        HAVING COUNT(challenges2.hackers2) = 1
    )
ORDER BY challenges_created DESC, Challenges.hacker_id;
