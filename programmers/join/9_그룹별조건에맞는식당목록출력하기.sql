-- 코드를 입력하세요
-- 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회
-- 리뷰 작성일 오름차순, 텍스트 기준 오름차순 정렬
# SELECT s.MEMBER_NAME, s.REVIEW_TEXT, s.REVIEW_DATE
SELECT
mr.MEMBER_NAME,
vv.REVIEW_TEXT,
DATE_FORMAT(vv.REVIEW_DATE, '%Y-%m-%d')
FROM
MEMBER_PROFILE mr
INNER JOIN
(
    SELECT 
    rv.MEMBER_ID, rv.REVIEW_TEXT, rv.REVIEW_DATE
    FROM
    REST_REVIEW rv
    JOIN
    (
        SELECT s.MEMBER_ID
        FROM
        (
            SELECT 
            r.MEMBER_ID,
            COUNT(r.REVIEW_ID) RCNT
            FROM
            REST_REVIEW r
            GROUP BY MEMBER_ID
        ) s
        INNER JOIN
        (
            SELECT MAX(i.RCNT) MAXR
            FROM
            (
                SELECT
                COUNT(r.REVIEW_ID) RCNT
                FROM REST_REVIEW r
                GROUP BY MEMBER_ID
            ) i
        ) e
        ON s.RCNT = e.MAXR
    ) cc
    ON rv.MEMBER_ID = cc.MEMBER_ID
) vv
ON mr.MEMBER_ID = vv.MEMBER_ID
ORDER BY vv.REVIEW_DATE, vv.REVIEW_TEXT;

-- 23:01~23:22(21분)
-- 리뷰 가장 많이 작성한 회원의 리뷰들을 조회 -> 여러 회원일 수도 있다.
-- 조회: 회원이름, 리뷰 텍스트, 리뷰 작성일
-- 순서: 리뷰작성일 오름, 리뷰 텍스트 오름
SET @maxRCnt = (
SELECT MAX(w.rCnt)
FROM (
        SELECT
    r.MEMBER_ID,
    COUNT(r.REVIEW_ID) rCnt
    FROM REST_REVIEW r
    GROUP BY MEMBER_ID
    ) w
);

SELECT
m.MEMBER_NAME,
w.REVIEW_TEXT,
DATE_FORMAT(w.REVIEW_DATE, "%Y-%m-%d") AS REVIEW_DATE
FROM MEMBER_PROFILE m JOIN REST_REVIEW w
ON m.MEMBER_ID = w.MEMBER_ID
WHERE m.MEMBER_ID IN (
    SELECT j.MEMBER_ID
    FROM (
        SELECT 
        k.MEMBER_ID,
        COUNT(k.REVIEW_ID) CNT
        FROM REST_REVIEW k
        GROUP BY MEMBER_ID
    ) j
    WHERE j.CNT = @maxRCnt
)
ORDER BY w.REVIEW_DATE, w.REVIEW_TEXT;

-- mySQL 사용자 변수를 활용하여 한층 간단하게 해봄