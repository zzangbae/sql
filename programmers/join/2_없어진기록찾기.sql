-- 코드를 입력하세요
SELECT 
ANIMAL_OUTS.ANIMAL_ID,
ANIMAL_OUTS.NAME
FROM ANIMAL_OUTS 
WHERE ANIMAL_OUTS.ANIMAL_ID NOT IN
(SELECT ANIMAL_ID
FROM ANIMAL_INS);

-- 코드를 입력하세요
-- 20:43~
-- 입양 간 기록은 있는데, 보호소에 들어온 기록이 없는
-- 동물ID 이름
-- ID순으로
SELECT
o.ANIMAL_ID, 
o.NAME
FROM
ANIMAL_INS i RIGHT JOIN ANIMAL_OUTS o
ON i.ANIMAL_ID = o.ANIMAL_ID
WHERE i.ANIMAL_ID IS NULL
ORDER BY o.ANIMAL_ID;

-- 첫번쨰 풀이:오른쪽 집합만 상정하고, 왼쪽 집합의 값에 NOT IN을 수행
-- 두번째 풀이:오른쪽 집합에서 가운데 교집합을 제외해서 풀었음