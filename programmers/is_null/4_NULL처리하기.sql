-- 생물종, 이름, 성별 및 중성화 여부
-- 아이디순으로 조회
-- 이름 없는 동물 No name
SELECT
ANIMAL_TYPE,
IFNULL(NAME, "No name") NAME,
SEX_UPON_INTAKE
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;