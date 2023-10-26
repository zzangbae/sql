-- 동일한 회원이 동일한 상품을 재구매한 데이터를 구하여,
-- 재구매한 회원 ID와 재구매한 상품ID를 출력
-- 회원ID 오름차순, 상품ID 내림차순
SELECT
w.USER_ID,
w.PRODUCT_ID
FROM (
    SELECT
    o.USER_ID,
    o.PRODUCT_ID,
    COUNT(o.ONLINE_SALE_ID) CNT
    FROM ONLINE_SALE o
    GROUP BY o.USER_ID, o.PRODUCT_ID
) w
WHERE w.CNT >= 2
ORDER BY USER_ID, PRODUCT_ID DESC;

-- 동일한 회원이 동일한 상품을 재구매한 데이터를 구하여,
-- 재구매한 회원 ID와 재구매한 상품ID를 출력
-- 회원ID 오름차순, 상품ID 내림차순
SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(*) >= 2
ORDER BY 1 ASC, PRODUCT_ID DESC;

-- 2로 풀면 서브쿼리없어도 된다.
-- Having을 통해서 group by절에 조건을 단다.
-- count(*)는 행의 갯수를 의미한다.
-- 즉, USER_ID, PRODUCT_ID같은 행이 몇개인지를 의미하는 것이다.
-- order by절에서 1은 USER_ID를 의미한다.

-- 다시풀기
-- 재구매가 일어난 회원 ID, 재구매한 상품 ID
-- 회원 ID 오름차순, 상품 ID 내림차순
SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(*) >= 2
ORDER BY USER_ID, PRODUCT_ID DESC;