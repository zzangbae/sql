-- 동물아이디, 이름, 중성화여부
-- 중성화되어있으면 O, 아니면 X
SELECT
ANIMAL_ID,
NAME,
CASE WHEN SEX_UPON_INTAKE LIKE "Neutered%" OR SEX_UPON_INTAKE LIKE "Spayed%"
    THEN "O"
    ELSE "X"
    END 중성화
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;