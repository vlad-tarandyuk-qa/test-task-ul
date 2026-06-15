-- Задача 1: Вторая зарплата
-- Найти вторую по величине уникальную зарплату. Если нет, вернуть NULL.

SELECT (
SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
OFFSET 1 LIMIT 1
) AS SecondHighestSalary;


-- Задача 2: Поиск дубликатов email
-- Найти все email, которые встречаются более одного раза.

SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;


-- Задача 3: Клиенты без заказов
-- Вернуть всех клиентов, у которых нет ни одного заказа.

SELECT c.name
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;
