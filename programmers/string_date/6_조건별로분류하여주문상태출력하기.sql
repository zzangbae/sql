-- 5월 1일기준
-- 주문ID, 제품ID, 출고일자, 출고여부
-- 출고여부: 5월 1일까지 출고완료, 이 후 날짜는 출고대기, 미정이면 출고미정
-- 주문ID 오름차순
SELECT
ORDER_ID,
PRODUCT_ID,
DATE_FORMAT(OUT_DATE, "%Y-%m-%d"),
CASE WHEN OUT_DATE <= "2022-05-01"
    THEN "출고완료"
    WHEN OUT_DATE > "2022-05-01"
    THEN "출고대기"
    ELSE "출고미정"
    END 출고여부
FROM FOOD_ORDER
ORDER BY ORDER_ID;