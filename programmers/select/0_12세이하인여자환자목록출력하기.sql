-- 코드를 입력하세요
-- 12:24~12:32(8분 -> 문제 조건(12세이하)를 못봄ㅋㅋㅋ)
-- 조회: 12세 이하인 환이름, 환자번호, 성별코드, 나이, 전화번호
-- 전화번호가 없는 경우 'NONE'
-- 순서: 나이 내림차순, 이름 오름차순
SELECT
p.PT_NAME,
p.PT_NO,
p.GEND_CD,
p.AGE,
IFNULL(TLNO, 'NONE') AS TLNO
FROM PATIENT p
WHERE p.GEND_CD = 'W' AND p.AGE <= 12
ORDER BY p.AGE DESC, p.PT_NAME;