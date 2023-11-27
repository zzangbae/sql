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

-- 23.11.27 다시풀기
-- 동물 이름이 두 번잇아 쓰인 이름
-- 해당 이름이 쓰인 횟수
-- 이름순
SELECT
NAME,
COUNT(ANIMAL_ID) COUNT
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
GROUP BY 1
HAVING COUNT(ANIMAL_ID) >= 2
ORDER BY 1;