-- 입양간 동물들
-- 보호기간이 가장 길었던 동물 두마리
-- 아이디, 이름
-- 보호기간이 긴 순으로 조회
SELECT
i.ANIMAL_ID,
i.NAME
FROM ANIMAL_INS i JOIN ANIMAL_OUTS o
ON i.ANIMAL_ID = o.ANIMAL_ID
ORDER BY DATEDIFF(o.DATETIME, i.DATETIME) DESC
LIMIT 2;