-- 2022년 10월 16일 대여중인 자동차
-- 16일에 반납해도 대여중

-- 대여불가 조건 -> 이 조건에 포함되는 CAR_ID는 제외한다.
-- 16일전에 빌려서 16일 이후에 빌려줌
-- 위의 쿼리를 서브쿼리로 두고, 다시 전체 테이블을 group해서 활용
SELECT
CAR_ID,
CASE WHEN CAR_ID IN (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE <= "2022-10-16" AND END_DATE >= "2022-10-16"
    GROUP BY CAR_ID
    ) THEN "대여중"
    ELSE "대여 가능"
    END AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;