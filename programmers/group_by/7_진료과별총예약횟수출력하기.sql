-- 2022년 5월 예약한 환자 수
-- 진료과코드 별로 조회
-- 진료과코드, 5월예약건수
-- 예약한 환자수 기준으로 오름차순, 진료과코드 오름차순
SELECT
w.진료과코드,
w.5월예약건수
FROM (
    SELECT
    MCDP_CD 진료과코드,
    COUNT(APNT_NO) 5월예약건수,
    COUNT(DISTINCT PT_NO) PT_NO
    FROM APPOINTMENT
    WHERE APNT_YMD BETWEEN "2022-05-01" AND "2022-05-31"
    GROUP BY MCDP_CD
) w
ORDER BY w.PT_NO, w.진료과코드;

-- 23.11.27 다시풀기
-- 2022년 5월
-- 진료과코드별로 예약한 환자
SELECT
MCDP_CD 진료과코드,
COUNT(*) 5월예약건수 
FROM APPOINTMENT
WHERE YEAR(APNT_YMD) = 2022 AND MONTH(APNT_YMD) = 5
GROUP BY MCDP_CD
ORDER BY 2, 1;