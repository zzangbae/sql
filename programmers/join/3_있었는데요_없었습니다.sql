-- 코드를 입력하세요
-- 보호 시작일보다 입양일이 더 빠른 동물
SELECT 
i.ANIMAL_ID,
o.NAME
FROM ANIMAL_INS i INNER JOIN ANIMAL_OUTS o
ON i.ANIMAL_ID = o.ANIMAL_ID
WHERE i.DATETIME >= o.DATETIME
ORDER BY i.DATETIME ASC;

-- 20:49~20:53
-- 보호 시작일보다 입양일이 더 빠른 동물
-- 아이디, 이름 조회
-- 보호 시작일이 빠른 순으로 조회
SELECT
o.ANIMAL_ID,
o.NAME
FROM ANIMAL_INS i JOIN ANIMAL_OUTS o
ON i.ANIMAL_ID = o.ANIMAL_ID
WHERE o.DATETIME < i.DATETIME  -- join을 통해서 나간동물들만 선정된다.
ORDER BY i.DATETIME;