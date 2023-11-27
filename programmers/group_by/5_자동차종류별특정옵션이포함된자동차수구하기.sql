-- 통풍시트, 열선시트, 가죽시트 중 하나 이상의 옵션이 포함된 자동차
-- 자동차 종류별로 몇대인지
-- 자동차 종류 오름차순
SELECT
CAR_TYPE,
COUNT(*) CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE "%통풍시트%" OR OPTIONS LIKE "%열선시트%" OR OPTIONS LIKE "%가죽시트"
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE;

-- REGEXP를 활용하여 아래와 같이 표현할 수 있다.
SELECT
    CAR_TYPE,
    COUNT(*) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS REGEXP '통풍시트|열선시트|가죽시트'
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE

-- 23.11.27 다시풀기
SELECT CAR_TYPE, COUNT(CAR_ID) CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE "%열선시트%"
OR OPTIONS LIKE "%통풍시트%"
OR OPTIONS LIKE "%가죽시트%"
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE;