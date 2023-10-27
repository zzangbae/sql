-- 몇시에 입양이 가장 활발하게 일어나는지 알아보려함(09:00~19:59)
-- 각 시간대별 입양이 몇건 발생했는지
-- 시간대 순으로 정렬
SELECT
HOUR(DATETIME) HOUR,
COUNT(*) COUNT
FROM ANIMAL_OUTS
WHERE HOUR(DATETIME) BETWEEN "09:00" AND "19:59"
GROUP BY HOUR(DATETIME)
ORDER BY 1;

-- HOUR() 함수의 활용
-- HOUR함수를 통해서 시간대별로 추출할 수 있다.