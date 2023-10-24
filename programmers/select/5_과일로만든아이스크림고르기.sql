-- 16:16~16:20
-- 상반기 아이스크림 주문량 3000초과 & 주성분이 과일인 아이스크림 맛
-- 총주문량이 큰 순서대로 조회
SELECT f.FLAVOR
FROM FIRST_HALF f JOIN ICECREAM_INFO i
ON i.FLAVOR = f.FLAVOR
WHERE f.TOTAL_ORDER > 3000 AND i.INGREDIENT_TYPE = "fruit_based"
ORDER BY f.TOTAL_ORDER DESC;