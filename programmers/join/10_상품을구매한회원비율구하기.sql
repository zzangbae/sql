-- 코드를 입력하세요
-- 2021년 가입한 회원들 중
-- 상품을 구매한 회원수, 상품을 구매한 비율
-- 년, 월 별로 출력하는 SQL

-- 0. 2021년 가입한 전체 회원수
SET @MCNT = (SELECT COUNT(USER_ID)
FROM USER_INFO info
WHERE info.JOINED < '2022-01-01' AND info.JOINED >= '2021-01-01');

SELECT
YEAR(w.SALES_DATE) AS YEAR,
MONTH(w.SALES_DATE) AS MONTH,
COUNT(DISTINCT w.USER_ID) AS PUCHASED_USERS,    -- 여기서 distinct를 해줘야 함
ROUND(COUNT(DISTINCT w.USER_ID) / @MCNT, 1) AS PUCHASED_RATIO
FROM
(
    -- 2. ONLINE_SALE과 조인
    SELECT os.ONLINE_SALE_ID, os.USER_ID, os.PRODUCT_ID, os.SALES_DATE
    FROM ONLINE_SALE os
    INNER JOIN
    (
        -- 1. 2021년에 가입한 회원 구하기
        SELECT USER_ID
        FROM USER_INFO ui
        WHERE ui.JOINED < '2022-01-01' AND ui.JOINED >= '2021-01-01'
    ) us
    ON os.USER_ID = us.USER_ID
    -- GROUP BY os.USER_ID -- 여기서 그룹바이를 하면서 정보가 줄어든다.
) w
GROUP BY YEAR(w.SALES_DATE), MONTH(w.SALES_DATE)
ORDER BY YEAR(w.SALES_DATE), MONTH(w.SALES_DATE);

