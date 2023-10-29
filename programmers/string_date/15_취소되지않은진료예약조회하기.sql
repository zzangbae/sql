-- 2022년 4월 13일 취소되지 않은 흉부외과(CS) 진료예약내역 조회
-- 진료예약번호, 환자이름, 환자번호, 진료과코드, 의사이름, 진료예약일시
-- 진료예약일시 기준 오름차순

-- 1. 2022년 4월 13일 취소되지 않은 진료부터 찾는다.(흉부외과)
-- 2. 조인해서 필요한 값들을 찾는다.
SELECT
a.APNT_NO,
p.PT_NAME,
p.PT_NO,
a.MCDP_CD,
d.DR_NAME,
a.APNT_YMD
FROM
PATIENT p JOIN (
    SELECT *
    FROM APPOINTMENT
    WHERE DATE_FORMAT(APNT_YMD, "%Y-%m-%d") = "2022-04-13" 
    AND MCDP_CD = "CS" AND APNT_CNCL_YN != "Y"
) a
ON p.PT_NO = a.PT_NO
JOIN DOCTOR d
ON d.DR_ID = a.MDDR_ID
ORDER BY APNT_YMD;

-- 사실 서브쿼리는 필요하지 않았다.
-- JOIN과 WHERE로 바로 필요한 값을 찾는다.

SELECT
a.APNT_NO,
p.PT_NAME,
p.PT_NO,
a.MCDP_CD,
d.DR_NAME,
a.APNT_YMD
FROM
PATIENT p
JOIN APPOINTMENT a
ON p.PT_NO = a.PT_NO
JOIN DOCTOR d
ON d.DR_ID = a.MDDR_ID
WHERE DATE_FORMAT(a.APNT_YMD, "%Y-%m-%d") = "2022-04-13" AND a.MCDP_CD = "CS" AND a.APNT_CNCL_YN != "Y"
ORDER BY APNT_YMD;