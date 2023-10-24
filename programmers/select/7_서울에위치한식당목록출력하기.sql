-- Lv4
-- 4:06~4:14(8분)
-- 서울위치 식당
-- 식당ID, 식당이름, 음식 종료, 즐겨찾기 수, 주소, 리뷰 평균 점수
-- 리뷰 평균점수 : 소숮점 세 번째 자리에서 반올림
-- 평균점수 내림차순, 즐겨찾기수 내림차순
SELECT
i.REST_ID,
i.REST_NAME,
i.FOOD_TYPE,
i.FAVORITES,
i.ADDRESS,
ROUND(AVG(r.REVIEW_SCORE), 2) SCORE
FROM REST_INFO i JOIN REST_REVIEW r
ON i.REST_ID = r.REST_ID
WHERE i.ADDRESS LIKE "서울%"
GROUP BY i.REST_ID
ORDER BY SCORE DESC, i.FAVORITES DESC;