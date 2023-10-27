-- 식품분류별 가격이 제일 비싼
-- 식품의 분류, 가격, 이름
-- 가격기준 내림차순
SELECT
a.CATEGORY,
a.PRICE,
a.PRODUCT_NAME
FROM FOOD_PRODUCT a JOIN (
    SELECT CATEGORY, MAX(PRICE) MAX_PRICE
    FROM FOOD_PRODUCT
    WHERE CATEGORY IN ("과자", "국", "김치", "식용유")
    GROUP BY CATEGORY
) b
ON a.CATEGORY = b.CATEGORY AND a.PRICE = b.MAX_PRICE
ORDER BY PRICE DESC;