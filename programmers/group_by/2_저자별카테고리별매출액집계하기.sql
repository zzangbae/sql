-- 2022년 1월 도서판매 데이터 기준
-- 저자별, 카테고리별 매출액(판매량 * 판매가)
-- 저자ID, 저자명, 카테고리, 매출액
-- 저자ID 오름차순, 카테고리 내림차순
SELECT
k.AUTHOR_ID,
k.AUTHOR_NAME,
k.CATEGORY,
SUM(k.SALES) TOTAL_SALES
FROM (
    SELECT
    s.AUTHOR_ID,
    s.AUTHOR_NAME,
    s.CATEGORY,
    s.PRICE * w.SALES SALES
    FROM (
        SELECT
        b.BOOK_ID,
        b.CATEGORY,
        b.AUTHOR_ID,
        b.PRICE,
        a.AUTHOR_NAME
        FROM BOOK b JOIN AUTHOR a
        ON b.AUTHOR_ID = a.AUTHOR_ID
    ) s
    JOIN BOOK_SALES w
    ON s.BOOK_ID = w.BOOK_ID
    WHERE w.SALES_DATE BETWEEN "2022-01-01" AND "2022-01-31"
) k
GROUP BY k.AUTHOR_NAME, k.CATEGORY
ORDER BY k.AUTHOR_ID, k.CATEGORY DESC;

-- 서브쿼리없이 조인 2번 바로가능
-- 그룹핑하고, SUM처리하면 바로 답이 나오게됨
SELECT
b.AUTHOR_ID,
a.AUTHOR_NAME,
b.CATEGORY,
SUM(bs.SALES * b.PRICE) TOTAL_SALES
FROM
BOOK_SALES bs 
JOIN BOOK b
ON bs.BOOK_ID = b.BOOK_ID
JOIN AUTHOR a
ON b.AUTHOR_ID = a.AUTHOR_ID
WHERE bs.SALES_DATE BETWEEN "2022-01-01" AND "2022-01-31"
GROUP BY b.AUTHOR_ID, b.CATEGORY
ORDER BY b.AUTHOR_ID, b.CATEGORY DESC;
