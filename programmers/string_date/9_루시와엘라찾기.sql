-- 이름이 아래인 동물의 아이디, 이름, 성별 및 중성화 여부조회
-- Lucy, Ella, Pickle, Rogan, Sabrina, Mitty
SELECT
ANIMAL_ID, NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME IN ("Lucy", "Ella", "Pickle", "Rogan", "Sabrina", "Mitty");