-- 코드를 입력하세요
-- 세단, SUV 자동차 중
-- 2022년 11월 1일부터 2022년 11월 30일까지 대여가능
-- 30일간의 대여금액이 50만원 이상 200만원 미만
-- 대여 금액을 기준으로 내림차순
-- 대여 금액 같을 경우 자동차 종류로 오름차순
-- 종류도 같으면 자동차 ID기준 내림차순
# SELECT a.CAR_ID, a.CAR_TYPE, a.DAILY_FEE
SELECT
w.CAR_ID,
w.CAR_TYPE,
w.FEE
FROM
    (
    SELECT 
    s.CAR_ID, 
    s.CAR_TYPE,
    ROUND(s.DAILY_FEE * 30 * (100 - e.DISCOUNT_RATE)/100) AS FEE
    FROM
    (   
        SELECT d.CAR_ID, d.CAR_TYPE, d.DAILY_FEE
        FROM
        (
            SELECT a.CAR_ID, a.CAR_TYPE, a.DAILY_FEE, b.END_DATE
            FROM CAR_RENTAL_COMPANY_CAR a
            LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY b
            ON a.CAR_ID = b.CAR_ID
            GROUP BY a.CAR_ID
        ) d
        WHERE d.END_DATE < '2022-11-01' OR d.END_DATE IS NULL
    ) s
    LEFT JOIN
    (
        SELECT *
        FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
    ) e
    ON s.CAR_TYPE = e.CAR_TYPE
    WHERE e.DURATION_TYPE LIKE "30%"
) w
WHERE FEE >= 500000 AND FEE < 2000000 AND (w.CAR_TYPE = '세단' OR w.CAR_TYPE = 'SUV')
ORDER BY FEE DESC, w.CAR_TYPE ASC, w.CAR_ID DESC;


-- 22:02~22:36(34분)
-- 세단, SUV 자동차중
-- 2022년 11월 1일 부터 11월 30일까지 대여가능
-- 대여 금액이 50만원 이상, 200만원 이하
-- 조회: 자동차ID, 자동차 종류, 대여금액(FEE)
-- 금액 DESC, 자동차 종류 오름차순, 자동차ID DESC

-- 안되는 차량 번호 지우기 먼저
SELECT
a.CAR_ID,
a.CAR_TYPE,
ROUND(a.DAILY_FEE * 30 * (100 - p.DISCOUNT_RATE) / 100) FEE
FROM
CAR_RENTAL_COMPANY_CAR a
JOIN
CAR_RENTAL_COMPANY_DISCOUNT_PLAN p
ON a.CAR_TYPE = p.CAR_TYPE
WHERE a.CAR_ID NOT IN (
    SELECT b.CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY b
    WHERE b.START_DATE <= "2022-11-01" AND b.END_DATE >= "2022-11-30" 
        OR b.START_DATE BETWEEN "2022-11-01" AND "2022-11-30"
        OR b.START_DATE <= "2022-11-01" AND b.END_DATE BETWEEN "2022-11-01" AND "2022-11-30"
    )
    AND (a.CAR_TYPE = "세단" OR a.CAR_TYPE = "SUV")
    AND p.DURATION_TYPE LIKE "30%"
    AND a.DAILY_FEE * 30 * (100 - p.DISCOUNT_RATE) / 100 BETWEEN 500000 AND 2000000
ORDER BY FEE DESC, a.CAR_TYPE, a.CAR_ID DESC;

-- 2번 풀이 훨씬 간단하게
-- 두번째 테이블에서 안되는 값을 받아 where절에 바로넣음
-- 그리고 필요한 조건은 where절에 둠