-- 두번이상쓰인이름, 해당이름이 쓰인 횟수
-- 이름없는 동물은 집계에서 제외, 결과는 이름순으로
-- Having으로 그룹에 쿼리결과에 조건을 추가함
SELECT
NAME,
COUNT(*)
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
GROUP BY NAME
HAVING COUNT(*) >= 2
ORDER BY NAME;