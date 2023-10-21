-- 코드를 입력하세요
-- 7월 아이스크림 총주문량과
-- 상반기 아이스크림 총주문량을 더한 값이
-- 더 큰 순서대로 3개의 맛 조회
SELECT f.FLAVOR
FROM FIRST_HALF f
JOIN(
    SELECT
    j.SHIPMENT_ID,
    j.FLAVOR,
    SUM(j.TOTAL_ORDER) AS TOTAL_ORDER
    FROM JULY j
    GROUP BY j.FLAVOR
    ) s
ON f.FLAVOR = s.FLAVOR
ORDER BY f.TOTAL_ORDER + s.TOTAL_ORDER DESC
LIMIT 3;

-- 21:39~21:49(10분)
-- 7월 아이스크림 총 주문량과 상반기 아이스크림 총 주문량을 더한 값
-- 큰 순서대로 상위 3개의 맛 조회
-- 단. 7월 아이스크림에서는 여러 공장에서 아이스크림을 만들었을 수 있다.
SELECT
w.FLAVOR
FROM
(
    SELECT
    f.FLAVOR,
    f.TOTAL_ORDER + s.TOTAL_ORDER TOTAL_ORDER
    FROM
    FIRST_HALF f
    JOIN (
        SELECT
        j.FLAVOR,
        SUM(j.TOTAL_ORDER) TOTAL_ORDER
        FROM JULY j
        GROUP BY j.FLAVOR
    ) s
    ON f.FLAVOR = s.FLAVOR
    ORDER BY TOTAL_ORDER DESC
) w
LIMIT 3;

-- 공부한점
-- ORDER BY 절에 순서를 먹일 때, SELECT에 있는게 아니라,
-- 그냥 컬럼값을 이용해서 해도 된다!