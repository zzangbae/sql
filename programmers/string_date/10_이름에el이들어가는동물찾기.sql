-- EL이 들어가는 개의 아이디와 이름
-- 이름순으로 조회, 대소문자 구문안함
SELECT
ANIMAL_ID,
NAME
FROM ANIMAL_INS
WHERE NAME LIKE "%EL%" AND ANIMAL_TYPE = "Dog"
ORDER BY NAME;