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

-- 23.11.27 다시풀기
-- 2022년 10월 16일에 대여중인 자동차 -> 대여중
-- 아닌 차 -> 대여 가능 10/16에 반나뱋도 대여중 표시
-- 자동차ID 기준 내림차순

SELECT
CAR_ID,
CASE WHEN CAR_ID IN (
    -- 10월 16일에 대여중인 차를 찾는다.
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE "2022-10-16" BETWEEN START_DATE AND END_DATE
    )
    THEN "대여중"
    ELSE "대여 가능"
    END AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY 1 DESC;

-- 추가적으로 공부한 내용
-- ("특정값" BETWEEN 컬럼값 AND 컬럼값)으로도 조건을 나타낼 수 있다.