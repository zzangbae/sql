-- 코드를 입력하세요
-- 아직 입양을 못 간 동물 중,
-- 가장 오래 보호소에 있었던 동물 3마리
-- 보호 시작일 순
SELECT
i.NAME,
i.DATETIME
FROM ANIMAL_INS i
LEFT JOIN ANIMAL_OUTS o
ON i.ANIMAL_ID = o.ANIMAL_ID
WHERE o.ANIMAL_ID IS NULL
ORDER BY i.DATETIME
LIMIT 3;

-- 20:56~20:59(3분)
-- 아직 입양을 못 간 동물들 중
-- 가장 오래 보호소에 있었던 동물 3마리
-- 이름과 보호 시작일 조회
-- 결과는 보호 시작일 순으로 조회
SELECT
i.NAME,
i.DATETIME
FROM
ANIMAL_INS i LEFT JOIN ANIMAL_OUTS o
ON i.ANIMAL_ID = o.ANIMAL_ID
WHERE o.DATETIME IS NULL
ORDER BY i.DATETIME
LIMIT 3;

-- 첫풀이와 두번째 풀이의 차이점은 where절이다.
-- 1번이나 2번이나 나간 동물을 거를 수 있다.