-- 년,월,성별 별로 상품을 구매한 회원수 집계
-- 결과 년 월 성별 기준으로 오름차순, 성별정보없으면 결과에서 제외
-- USER_INFO와 ONLINE_SALE을 조인하고
-- WHERE절을 통해서 성별이 NULL인 애들을 없앤다.
SELECT
YEAR(o.SALES_DATE) YEAR,
MONTH(o.SALES_DATE) MONTH,
u.GENDER,
COUNT(DISTINCT u.USER_ID) USERS
FROM USER_INFO u JOIN ONLINE_SALE o
ON u.USER_ID = o.USER_ID
WHERE u.GENDER IS NOT NULL
GROUP BY YEAR(o.SALES_DATE), MONTH(o.SALES_DATE), u.GENDER
ORDER BY YEAR, MONTH, GENDER;

-- 23.11.27 다시풀기
-- 년, 월, 성별 별로 상품을 구매한 회원수 집계
-- 년, 월, 성별 기준 오름차순
-- 성별정보없으면 결과에서 제외
SELECT
YEAR(o.SALES_DATE) YEAR, 
MONTH(o.SALES_DATE) MONTH, 
u.GENDER,
COUNT(DISTINCT u.USER_ID) USERS
FROM USER_INFO u JOIN ONLINE_SALE o
ON u.USER_ID = o.USER_ID   -- 유저 아이디 정보를 추가해줌
AND u.GENDER IS NOT NULL
GROUP BY 1, 2, 3
ORDER BY 1, 2, 3;