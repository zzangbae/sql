-- 코드를 입력하세요
-- 자동차 종류가 SUV
-- 인 자동차들의 평균 일일 대여 금액
-- 소수점 첫 번째 자리에서 반올림
-- 형식 지정
SELECT
ROUND(AVG(DAILY_FEE)) AVERAGE_FEE
FROM CAR_RENTAL_COMPANY_CAR c
WHERE c.CAR_TYPE = 'SUV';