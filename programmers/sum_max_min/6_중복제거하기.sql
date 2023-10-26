-- count(*): 전체행 숫자 계산일때는 null을 포함합니다.
-- 하지만 특정 컬럼의 레코드 갯수를 셀 때는 null을 포함하지 않고 셉니다.
-- distinct절은 중복을 제거한다.
SELECT COUNT(DISTINCT NAME) count
FROM ANIMAL_INS;