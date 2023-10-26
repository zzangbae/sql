-- 2022년 3월 오프라인/온라인 상품 판매데이터
-- 판매 날짜, 상품ID, 유저ID, 판매량
-- OFFLINE_SALE 판매 데이터의 USER_ID는 NULL
-- 판매일 오름차순, 상품ID 오름차순, 유저ID 오름차순

SELECT 
DATE_FORMAT(o.SALES_DATE, "%Y-%m-%d") SALES_DATE,
o.PRODUCT_ID,
o.USER_ID,
o.SALES_AMOUNT
FROM ONLINE_SALE o
WHERE o.SALES_DATE BETWEEN "2022-03-01" AND "2022-03-31"
UNION ALL
SELECT
DATE_FORMAT(f.SALES_DATE, "%Y-%m-%d") SALES_DATE,
f.PRODUCT_ID,
NULL USER_ID,
f.SALES_AMOUNT
FROM
OFFLINE_SALE f
WHERE f.SALES_DATE BETWEEN "2022-03-01" AND "2022-03-31"
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID;

-- 몰랐던 점
-- UNION ALL vs UNION => UNION ALL은 중복 가능, UNION은 중복 삭제
-- UNION은 칼럼의 수와 데이터형 순서가 동일해야한다.
-- 이 때, 기술적으로 NULL as USER_ID를 활용함

-- 다시풀기
-- 2022년 3월 오프라인, 온라인 상품 판매 데이터
-- 판매 날짜, 상품ID, 유저ID, 판매량
-- OFFLINE_SALE USER_ID는 NULL표시
-- 판매일 기준 오름차순, 상품ID 오름차순, 유저ID 오름차순
SELECT
DATE_FORMAT(SALES_DATE, "%Y-%m-%d") SALES_DATE,
PRODUCT_ID,
USER_ID,
SALES_AMOUNT
FROM ONLINE_SALE
WHERE SALES_DATE BETWEEN "2022-03-01" AND "2022-03-31"
UNION ALL
SELECT
DATE_FORMAT(SALES_DATE, "%Y-%m-%d") SALES_DATE,
PRODUCT_ID,
NULL USER_ID,
SALES_AMOUNT
FROM OFFLINE_SALE
WHERE SALES_DATE BETWEEN "2022-03-01" AND "2022-03-31"
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID;