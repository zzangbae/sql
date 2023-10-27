-- 대여 시작일을 기준으로 2022년 8월부터 2022년 10월까지 대여횟수가 5회 이상인 자동차
-- 해당 기간 동안 월별 자동차 ID별 총 대여횟수
-- 월 오름차순, id 내림차순
-- 1. 2022년 8월부터 10월까지 대여횟수가 5회 이상인 자동차들을 먼저 뽑는다.
-- 2. 이 자동차들에 포함되고, 조건기간 내의 데이터 들을 다시 group시켜서 결과값을 뽑아낸다.
SELECT
MONTH(START_DATE) MONTH,
CAR_ID,
COUNT(*) RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE CAR_ID IN (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE BETWEEN "2022-08-01" AND "2022-10-31"
    GROUP BY CAR_ID
    HAVING COUNT(*) >= 5
) AND START_DATE BETWEEN "2022-08-01" AND "2022-10-31"
GROUP BY MONTH(START_DATE), CAR_ID
ORDER BY MONTH, CAR_ID DESC;