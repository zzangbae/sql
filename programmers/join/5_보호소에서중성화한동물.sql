-- 코드를 입력하세요
-- 보호소에 들어올 때는 중성화X
-- 보호소를 나갈 때는 중성화O
SELECT
i.ANIMAL_ID,
i.ANIMAL_TYPE,
i.NAME
FROM
    (SELECT *
    FROM ANIMAL_INS
    WHERE ANIMAL_INS.SEX_UPON_INTAKE LIKE "Intact %") i
JOIN
    (SELECT *
    FROM ANIMAL_OUTS
    WHERE ANIMAL_OUTS.SEX_UPON_OUTCOME LIKE "Spayed %"
    OR ANIMAL_OUTS.SEX_UPON_OUTCOME LIKE "Neutered %") o
ON i.ANIMAL_ID = o.ANIMAL_ID
ORDER BY i.ANIMAL_ID ASC;

-- 위에는 너무 어렵게 풀었다. 그냥 조인한거에서 조건을 줘서 거르면 되었다.

-- 21:33~21:36(3분)
-- 보호소에 들어올 때는 중성화X
-- 보호소에서 나갈 때는 중성화
-- 아이디, 생물 종, 이름 조회
SELECT
i.ANIMAL_ID,
i.ANIMAL_TYPE,
i.NAME
FROM
ANIMAL_INS i JOIN ANIMAL_OUTS o
ON i.ANIMAL_ID = o.ANIMAL_ID
WHERE i.SEX_UPON_INTAKE LIKE "Intact%" AND 
(o.SEX_UPON_OUTCOME LIKE "Spayed%" OR o.SEX_UPON_OUTCOME LIKE "Neutered%");