-- 네비게이션 옵션 포함 자동차
-- 자동차 ID기준 내림차순
SELECT *
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE "%네비게이션%"
ORDER BY CAR_ID DESC;